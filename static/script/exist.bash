#!/bin/bash

exist() {
	which "${1}" > /dev/null 2>&1 || return 1
	return 0
}
