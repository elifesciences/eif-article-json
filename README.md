# elife-article-json

This repository contains the derived JSON data from the XML in the
[elife-articles](https://github.com/elifesciences/elife-articles).

This repository is _automatically updated_ nightly with the latest description
used by the [jats-scraper](https://github.com/elifesciences/jats-scraper)
and with the new articles are added to the `elife-articles` 
repository.

## usage

The JSON in this repository can be regenerated at any time by running
the `generate-json.sh` script.

    $ ./generate-json.sh

## Licence

Any code in this repository is licensed under the GNU GPLv3.

The article JSON is derived from the article XML which is 
available under the Creative Commons licence.
