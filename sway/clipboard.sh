#!/bin/env bash

CLIPBOARD=/tmp/clipboard
COUNT=10

touch $CLIPBOARD

wl-paste >> $CLIPBOARD

TMP=$(mktemp)
tac $CLIPBOARD | awk '!seen[$0]++' | tac | tail -n $COUNT > $TMP
rm $CLIPBOARD
mv $TMP $CLIPBOARD
