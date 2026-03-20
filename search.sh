#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat >&2 <<EOF
Usage: $(basename "$0") "query" [-n NUM]

Options:
  -n NUM    Number of results to return (default: 10)
  -h        Show this help

Environment:
  ANSPIRE_API_KEY   Required. Your Anspire API key.

Examples:
  ./search.sh "latest AI news"
  ./search.sh "React 19 release notes" -n 5
EOF
  exit 1
}

QUERY=""
TOP_K=10

while [[ $# -gt 0 ]]; do
  case "$1" in
    -n)
      TOP_K="$2"
      shift 2
      ;;
    -h|--help)
      usage
      ;;
    -*)
      echo "Unknown option: $1" >&2
      usage
      ;;
    *)
      QUERY="$1"
      shift
      ;;
  esac
done

if [[ -z "$QUERY" ]]; then
  usage
fi

if [[ -z "${ANSPIRE_API_KEY:-}" ]]; then
  echo "Error: ANSPIRE_API_KEY is not set." >&2
  echo "Set it with: export ANSPIRE_API_KEY=your_key_here" >&2
  exit 1
fi

RESPONSE=$(curl --silent --show-error --fail --location --get \
  "https://plugin.anspire.cn/api/ntsearch/search" \
  --data-urlencode "query=$QUERY" \
  --data-urlencode "top_k=$TOP_K" \
  --header "Authorization: Bearer $ANSPIRE_API_KEY" \
  --header "Accept: application/json")

# Format output using Python3 if available, otherwise print raw JSON
if command -v python3 &>/dev/null; then
  echo "$RESPONSE" | python3 - <<'PYEOF'
import json, sys

try:
    data = json.load(sys.stdin)
except json.JSONDecodeError as e:
    print(f"Failed to parse response: {e}", file=sys.stderr)
    sys.exit(1)

# Handle common response envelope shapes
results = (
    data.get("results")
    or data.get("items")
    or data.get("data")
    or (data if isinstance(data, list) else [data])
)

if not results:
    print("No results found.")
    sys.exit(0)

for i, r in enumerate(results, 1):
    print(f"--- Result {i} ---")
    title   = r.get("title") or r.get("name") or ""
    link    = r.get("url") or r.get("link") or r.get("href") or ""
    snippet = r.get("snippet") or r.get("description") or r.get("content") or r.get("summary") or ""
    if title:
        print(f"Title: {title}")
    if link:
        print(f"Link: {link}")
    if snippet:
        print(f"Snippet: {snippet[:500]}")
    print()
PYEOF
else
  echo "$RESPONSE"
fi
