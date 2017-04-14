#!/bin/bash
dir_name=$(dirname $0)
RUBYOPT="-r $dir_name/dynamic_patch.rb" "$dir_name/run.sh"
