#!/bin/bash

cd /tmp && scp kt:~/Dropbox/kreweoftucks/database.tgz .
tar xvfpz database.tgz
mv home/safety/database/dump/kreweoftucks ./krewe
mongorestore --db krewe ./krewe
