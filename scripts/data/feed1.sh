#!/bin/bash

for n in $(seq 1 20); do echo "INCRBY mykey 10";done | redis-cli -h $1 -p $2 -a $3 > /dev/null

