#!/bin/bash

set -e
rsyslogd -n && crond -f -l 2
