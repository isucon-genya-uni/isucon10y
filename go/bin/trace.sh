#!/bin/bash

curl -s "http://localhost:6060/debug/pprof/trace?seconds=$1" > $2
