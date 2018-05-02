#!/bin/bash

docker run -d --name test -e VIRTUAL_HOST=example.com \
	-e LETSENCRYPT_HOST=example.com -e LETSENCRYPT_EMAIL=foo@bar.com \
	-e LETSENCRYPT_TEST=true tutum/apache-php
