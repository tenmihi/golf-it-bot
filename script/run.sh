#! /bin/zsh

# script directory path
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# launch bot
ruby $DIR/../lib/bot.rb
