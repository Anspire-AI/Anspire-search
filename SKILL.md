---
name: anspire-search
description: "Anspire Search: real-time web search for news, events & time-sensitive facts. Requires: curl. Needs ANSPIRE_API_KEY env var. Calls plugin.anspire.cn only."
homepage: https://github.com/Anspire-AI/Anspire-search
requires:
  env:
    - ANSPIRE_API_KEY
  bins:
    - curl
metadata: {"openclaw":{"emoji":"🔎","requires":{"env":["ANSPIRE_API_KEY"],"anyBins":["curl"]}}}
---
# Anspire Search · Anspire 实时搜索

Real-time web search via the Anspire Search API. Lightweight, no browser required.

通过 Anspire 搜索 API 进行实时网络搜索。轻量级，无需浏览器。

## Setup · 配置

Set your API key / 设置 API Key：

```bash
export ANSPIRE_API_KEY=your_key_here
```

Make the script executable (first time only) / 首次使用前赋予执行权限：

```bash
chmod +x search.sh
```

## Search · 搜索用法

```bash
./search.sh "query"          # Basic search, 10 results · 基础搜索，返回 10 条
./search.sh "query" -n 5     # Limit to 5 results · 限制返回 5 条
./search.sh -h               # Show help · 显示帮助
```

## Output Format · 输出格式

```
--- Result 1 ---
Title: Page Title
Link: https://example.com/page
Snippet: Description from search results

--- Result 2 ---
...
```

## When to Use · 使用时机

* The user asks to search the web, browse, look up, or verify recent information
  （用户需要搜索网页、查询或核实近期信息）
* The question depends on current events, recent news, policy changes, market updates, or time-sensitive facts
  （问题涉及当前事件、近期新闻、政策变动、市场动态等时效性内容）
* The answer would be unreliable without live internet access
  （不依赖实时互联网则无法给出可靠回答）

## When Not to Use · 不适用场景

* The request can be answered from stable knowledge alone
  （可从稳定知识回答，无需实时数据）
* The user only wants rewriting, translation, brainstorming, or code edits unrelated to live information
  （用户只需改写、翻译、头脑风暴或代码编辑，与实时信息无关）
* `ANSPIRE_API_KEY` is unavailable
  （环境变量 `ANSPIRE_API_KEY` 未设置）

## Required Behavior · 必要行为

1. Build a concise search query from the user's request.
   （根据用户请求构建简洁的搜索词）
2. Run `./search.sh "query"` (or `./search.sh "query" -n N` for more/fewer results).
   （执行 `./search.sh "搜索词"`，需要更多/更少结果时加 `-n N`）
3. Parse the formatted output — each result has **Title**, **Link**, and **Snippet**.
   （解析格式化输出——每条结果包含 **Title**、**Link** 和 **Snippet**）
4. Summarize the results in the user's language.
   （用用户所用语言总结搜索结果）
5. Cite source titles or domains for important claims.
   （对重要论断注明信息来源的标题或域名）
6. If the call fails or returns no results, say so clearly — never fabricate a live answer.
   （若调用失败或无结果，如实告知——绝不捏造实时答案）

---

> All API calls go to `plugin.anspire.cn` only. No data is forwarded to third parties.
> 所有 API 调用仅访问 `plugin.anspire.cn`，不会将数据转发给第三方。
