#!/usr/bin/env bash

light -N 20
echo "$(light | cut -d. -f1)"