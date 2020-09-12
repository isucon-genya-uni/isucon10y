#!/bin/bash

curl -s "http://localhost:6060/debug/fgprof?seconds=$1&format=folded" > $2
