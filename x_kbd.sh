#!/bin/sh
if [ "$1" = "us" ]
then
  setxkbmap -layout us
elif [ "$1" = "intl" ]
then
  setxkbmap -layout us -variant intl
fi
