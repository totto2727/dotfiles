#!/bin/bash

exist() {
	type "${1}" >/dev/null 2>&1 || exit 1
}
