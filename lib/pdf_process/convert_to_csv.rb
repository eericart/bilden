#!/usr/bin/env jruby

%x(/opt/jruby/bin/tabula -n -g -p #{ARGV[1]} #{ARGV[2]})