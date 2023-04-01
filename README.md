# Nostr Decentralised XKCD

This is an experiment to see if we can host addressible content on the Nostr network, and build a functional client web app.

Demo Live WebApp: (https://cdn.nostrgraph.net/public/xkcd.html)[https://cdn.nostrgraph.net/public/xkcd.html]

All media rights owned by (https://xkcd.com)[https://xkcd.com].

## Components

```
download_json.sh - Download all XKCD JSON metadata to the data folder
download_images.sh - Download all XKCD Images to the images folder
convert.rb - Ruby converter for XKCD JSON into Nostr Events
```

## Usage

1. Download all JSON files using `download_json.sh`
2. Set `NOSTR_SECKEY` in `.env`
3. Run `Bundle` and then `convert.rb`
4. Publish all the events in the `events/` directory to your favourite relays
5. Update `index.html` code to connect to your desired relay
6. Open `index.html`
