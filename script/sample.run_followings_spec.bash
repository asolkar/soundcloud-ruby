#!/bin/bash

export CLIENT_ID=''
export CLIENT_SECRET=''
export ACCESS_TOKEN=''
export TEST_ID=''
export SOUNDCLOUD_URL='https://soundcloud.com/asolkar/the-encounter'
export RESOLVED_URL='https://api.soundcloud.com/tracks/104648202.json'

echo CLIENT_ID: $CLIENT_ID
echo CLIENT_SECRET: $CLIENT_SECRET
echo ACCESS_TOKEN: $ACCESS_TOKEN
echo TEST_ID: $TEST_ID
echo SOUNDCLOUD_URL: $SOUNDCLOUD_URL
echo RESOLVED_URL: $RESOLVED_URL

echo '------'

ruby -S rspec spec/followings_spec.rb
