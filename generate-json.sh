#!/bin/bash
set -e

# installs the jat-scraper, the elife-article XML and runs the jats-scraper 
# over the article XML into the article-json directory.
# use ctrl-c to quit.
# @author Luke Skibinski <l.skibinski@elifesciences.org>

install_jats_scraper() {
    # destroy any trace of the jats-scraper
    rm -rf ./jats-scraper/
    git clone https://github.com/elifesciences/jats-scraper
    cd jats-scraper
    
    # create a virtualenvinstall deps
    virtualenv venv --python=`which python2`
    source venv/bin/activate
    
    # install deps
    `which pip2` install -r requirements.txt
    pip install jmespath # not part of jats-scraper but needed for this script
    
    # retreat back to parent
    cd .. 
}

install_update_article_xml() {
    # we need the article xml to generate the json.
    if [ -d article-xml ]; then
        git -C article-xml reset --hard && \
        git -C article-xml pull
    else
        git clone https://github.com/elifesciences/elife-articles article-xml
    fi
}

generate_json() {
    # generate json for ALL articles. 
    # this will create new json and overwrite existing json
    mkdir -p article-json
    for file in article-xml/*.xml; do
        echo "processing $file ..."
        # strip off outer layers of data structure that the scraper adds then
        # output to file.
        # '$file' in this case is the relative path to the file: article-xml/foo.xml
        `which python2` jats-scraper/feeds.py ./$file | jp.py [0].article[0] > ./article-json/$(basename $file).json
        ret=$?
        if [ $ret != 0 ]; then
            echo "failed to process article $file" >> errors.log
            continue
        fi
    done
}

control_c() {
    echo "interrupt caught, exiting. this script can be run multiple times ..."
    exit $?
}

trap control_c SIGINT

install_jats_scraper
install_update_article_xml
generate_json
