#! /bin/zsh

set -eu

# script directory path
DIR=$(cd "$(dirname "$0")" && pwd)

# log file store path
LOG_PATH=$DIR/../log
mkdir -p $LOG_PATH

# launch bot
ruby $DIR/../lib/bot.rb -D |& tee $LOG_PATH/stdout_and_stderr.txt
