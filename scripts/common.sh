set -euo pipefail

abort() {
  echo -e "\033[0;31mError: $*\033[0m" >&2
  exit 1
}
