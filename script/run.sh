#! /bin/zsh

# script directory path
DIR=$(dirname $(readlink -f $0))

# launch bot
ruby $DIR/../lib/bot.rb
