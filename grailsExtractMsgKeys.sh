#!/bin/sh

IFS=$'\n';
LINES=`grep -RE "g:message .*code=[^\>]+\>" * | grep -v src/templates`
for LINE in $LINES;
do
  KEY=`echo $LINE | sed "s/^.*code=[\"\']\([^\"\']*\).*/\1/g"`
  if [[ "$LINE" == *default=* ]]
  then
    VALUE=`echo $LINE | sed "s/^.*default=[\"\']\([^\"\']*\).*/\1/g"`
  else
    VALUE=""
  fi;
  echo "$KEY=$VALUE"
done;

