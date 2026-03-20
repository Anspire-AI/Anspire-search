---
name: anspire-search
slug: anspire-search
version: 1.0.0
description: Real-time web search via Anspire Search API. Use when the user asks for current events, recent news, time-sensitive facts, or any query requiring live internet access. No browser required.
user-invocable: true
homepage: https://github.com/Anspire-AI/Anspire-search
metadata: {"openclaw":{"emoji":"🔎","homepage":"https://github.com/Anspire-AI/Anspire-search","primaryEnv":"ANSPIRE_API_KEY","requires":{"env":["ANSPIRE_API_KEY"],"bins":["curl"]}}}
---
# Anspire Search

Real-time web search via the Anspire Search API. Lightweight, no browser required.

## Setup

Set your API key once:

```bash
export ANSPIRE_API_KEY=your_key_here
```

Make the script executable (first time only):

```bash
chmod +x search.sh
```

## Search

```bash
./search.sh "query"          # Basic search (10 results)
./search.sh "query" -n 5     # Limit to 5 results
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

* The user asks to search the web, browse, look up, or verify recent information
* The question depends on current events, recent news, policy changes, market updates, or time-sensitive facts
* The answer would be unreliable without live internet access

## When Not to Use

* The request can be answered from stable knowledge alone
* The user only wants rewriting, translation, brainstorming, or code edits unrelated to live information
* `ANSPIRE_API_KEY` is unavailable

## Required Behavior

1. Build a concise search query from the user's request.
2. Run `./search.sh "query"` (or `./search.sh "query" -n N` for more/fewer results).
3. Parse the formatted output — each result has **Title**, **Link**, and **Snippet**.
4. Summarize the results in the user's language.
5. Cite source titles or domains for important claims.
6. If the call fails or returns no results, say so clearly — never fabricate a live answer.
