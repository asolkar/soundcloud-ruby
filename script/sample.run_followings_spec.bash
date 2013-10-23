#!/bin/bash

export CLIENT_ID=''
export CLIENT_SECRET=''
export ACCESS_TOKEN=''
export TEST_ID=''

echo CLIENT_ID: $CLIENT_ID
echo CLIENT_SECRET: $CLIENT_SECRET
echo ACCESS_TOKEN: $ACCESS_TOKEN
echo TEST_ID: $TEST_ID

echo '------'

ruby -S rspec spec/followings_spec.rb
