require 'nostr'
require 'oj'
require 'dotenv/load'
require 'json/minify'
require 'date'

private_key = ENV['NOSTR_SECKEY']

# Load Nostr keypair
keygen  = Nostr::Keygen.new
keypair = Nostr::KeyPair.new(
  private_key: private_key,
  public_key: keygen.extract_public_key(private_key)
)

# Add the keypair to the user facade
user = Nostr::User.new(keypair: keypair)

# client = Nostr::Client.new
# relay  = Nostr::Relay.new(url: 'wss://nos.lol', name: 'Damus') # wss://relay.damus.io

# client.connect(relay)
Dir.mkdir('data') unless Dir.exist?('data')

# Filter all files to process
files = Dir['data/*']
  .select {|x| x =~ /[0-9]+\.json$/ }
  .sort_by{ |name| [name[/\d+/].to_i, name] }

# Process each file into a Nostr event
for file_name in files do

  file = File.read(file_name)
  data_hash = JSON.parse(file)

  # Create a signed event
  event = user.create_event(
    kind: 30078,
    tags: [
      ['d', "xkcd:#{data_hash['num']}"]
    ],
    content: JSON.generate(data_hash)
  )

  event_json = event.to_h.to_json
  puts event_json

  File.write("events/#{data_hash['num']}.json", event_json)

  # client.publish(event)
  # sleep
end
