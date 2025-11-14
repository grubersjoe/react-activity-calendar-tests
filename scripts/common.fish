#!/usr/bin/env bash
set -euo pipefail

abort() {
  printf "\033[31mError: %s\033[0m\n" "$*" 1>&2
  exit 1
}