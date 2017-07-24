#! /bin/zsh

# script directory path
DIR=$(dirname $(readlink -f $0))

# launch bot as daemon
ruby $DIR/../lib/bot.rb -D
