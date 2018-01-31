#!/bin/bash

git config --global user.name "David Robinson"
git config --global user.email "david.pl.robinson@googlemail.com"
git config --global credential.helper store
git config --global push.default matching
git remote add scripts https://github.com/davidplrobinson/scripts.git
