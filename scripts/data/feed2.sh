#!/bin/bash

for n in $(seq 1 10); do echo "DECRBY mykey 10";done | redis-cli -h $1 -p $2 -a $3  > /dev/null

