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

Real-time web search via the Anspire Search API. No browser, no npm, no setup beyond one env var.

通过 Anspire 搜索 API 进行实时网络搜索。无需浏览器，无需安装依赖，只需设置一个环境变量。

## Setup · 配置

Set the API key once / 设置 API Key（仅需一次）：

```bash
export ANSPIRE_API_KEY=your_key_here
```

That's it. No other setup required. / 仅此而已，无需其他配置。

## When to Use · 使用时机

* The user asks to search the web, browse, look up, or verify recent information
  （用户需要搜索网页、查询或核实近期信息）
* The question depends on current events, recent news, policy changes, market updates, or time-sensitive facts
  （问题涉及时事、近期新闻、政策变动、市场动态等时效性内容）
* The answer would be unreliable without live internet access
  （不依赖实时互联网则无法给出可靠答案）

## When Not to Use · 不适用场景

* The request can be answered from stable knowledge alone
  （可从已有知识回答，无需实时数据）
* The user only wants rewriting, translation, brainstorming, or code edits
  （用户只需改写、翻译、头脑风暴或代码编辑）
* `ANSPIRE_API_KEY` is not set
  （环境变量 `ANSPIRE_API_KEY` 未设置）

## How to Search · 执行搜索

Run this curl command, replacing `QUERY` with the actual search terms:

执行以下 curl 命令，将 `QUERY` 替换为实际搜索词：

```bash
curl --silent --show-error --fail --location --get \
  "https://plugin.anspire.cn/api/ntsearch/search" \
  --data-urlencode "query=QUERY" \
  --data-urlencode "top_k=10" \
  --header "Authorization: Bearer $ANSPIRE_API_KEY" \
  --header "Accept: application/json"
```

To get more or fewer results, change `top_k`. / 调整 `top_k` 可控制返回结果数量。

## Reading the Response · 解析响应

The API returns JSON. Extract the relevant fields from each result item:

API 返回 JSON，从每条结果中提取以下字段：

| Field · 字段 | Description · 说明 |
|---|---|
| `title` | Page title · 页面标题 |
| `url` | Page URL · 页面链接 |
| `snippet` | Summary excerpt · 摘要片段 |

## Required Behavior · 必要行为

1. Build a concise search query from the user's request.
   （从用户请求中提炼简洁的搜索词）
2. Run the curl command above with `QUERY` substituted.
   （执行上方 curl 命令，将 `QUERY` 替换为实际搜索词）
3. Parse the JSON response and extract `title`, `url`, and `snippet` per result.
   （解析 JSON 响应，提取每条结果的 `title`、`url`、`snippet`）
4. Summarize the results in the user's language.
   （用用户所用语言总结搜索结果）
5. Cite source titles or domains for important claims.
   （对重要论断注明信息来源标题或域名）
6. If the call fails or returns no results, say so clearly — never fabricate a live answer.
   （若调用失败或无结果，如实告知——绝不捏造实时答案）

---

> All API calls go to `plugin.anspire.cn` only. No data forwarded to third parties.
> 所有 API 调用仅访问 `plugin.anspire.cn`，不会将数据转发给第三方。
