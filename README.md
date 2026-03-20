# Anspire Search

Real-time web search via the [Anspire Search API](https://plugin.anspire.cn). Lightweight, no browser required.

**MIT** · [![ClawHub](https://img.shields.io/badge/ClawHub-anspire--search-blue)](https://clawhub.ai)

## Setup

Set your API key once:

```bash
export ANSPIRE_API_KEY=your_key_here
```

Make the script executable (first time only):

```bash
chmod +x search.sh
```

## Usage

```bash
./search.sh "query"          # Basic search (10 results)
./search.sh "query" -n 5     # Limit to 5 results
./search.sh -h               # Show help
```

## Output Format

```
--- Result 1 ---
Title: Page Title
Link: https://example.com/page
Snippet: Description from search results

--- Result 2 ---
...
```

## When to Use

* Searching for recent news, current events, or policy changes
* Verifying up-to-date facts or documentation
* Looking up information that changes frequently over time
* Any query that requires live internet access

## Requirements

| Requirement | Details |
|-------------|---------|
| `ANSPIRE_API_KEY` | Required. Your Anspire API key. |
| `curl` | Pre-installed on macOS/Linux. |
| `python3` | Optional. Used for formatted output (falls back to raw JSON). |

## API

Powered by [Anspire](https://plugin.anspire.cn) — a real-time web search API.

| Parameter | Type   | Description                        |
|-----------|--------|------------------------------------|
| `query`   | string | The search query string            |
| `top_k`   | int    | Number of results (default: 10)    |

## License

MIT © [Anspire-AI](https://github.com/Anspire-AI)
