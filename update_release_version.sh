#!/bin/sh

current_date=$(date -u +"%Y-%m-%d")
printf "%s" "$current_date" > version.txt