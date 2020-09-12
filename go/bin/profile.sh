#!/bin/bash

curl -s "http://localhost:6060/debug/pprof/profile?seconds=$1" > $2
