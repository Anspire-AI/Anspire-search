---
name: anspire-search
description: "Anspire Search: real-time web search for news, events & time-sensitive facts. Requires: curl. Uses ANSPIRE_API_KEY. If the key is missing, OpenClaw must proactively ask whether the user wants help configuring it. Calls plugin.anspire.cn only."
homepage: https://github.com/Anspire-AI/Anspire-search
requires:
  bins:
    - curl
metadata: {"openclaw":{"emoji":"🔎","requires":{"anyBins":["curl"]}}}
---
# Anspire Search · Anspire 实时搜索

Real-time web search via the Anspire Search API. No browser, no npm, no setup beyond one env var.

通过 Anspire 搜索 API 进行实时网络搜索。无需浏览器，无需安装依赖，只需设置一个环境变量。

## Setup · 配置

Set the API key once / 设置 API Key（仅需一次）：

```bash
export ANSPIRE_API_KEY='your_exact_full_key_here'
```

That's it. No other setup required. / 仅此而已，无需其他配置。

If helping the user configure the key, preserve the exact full key string exactly as provided.
若协助用户配置 key，必须逐字保留用户提供的完整 key。

Example with a prefix kept intact / 保留前缀的示例：

```bash
export ANSPIRE_API_KEY='sk-example-full-key'
```

Key formatting rules / Key 格式规则：

* Treat the key as opaque text. Do not shorten, normalize, or rewrite it.
  （将 key 视为不可拆分的原始文本，不得缩写、规范化或改写）
* Preserve the entire value, including prefixes such as `sk-` when present.
  （必须保留完整值；若带有 `sk-` 等前缀，也必须完整保留）
* Do not insert spaces, tabs, line breaks, or extra characters inside the key.
  （不得在 key 内插入空格、制表符、换行或任何额外字符）
* Do not drop leading, middle, or trailing characters from the key.
  （不得丢失 key 开头、中间或结尾的任何字符）
* When showing an export command, keep the key on one line as a single uninterrupted string.
  （给出 export 命令时，key 必须保持单行连续，不可断开）

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
* Live search is needed but the user declines to configure `ANSPIRE_API_KEY`
  （需要实时搜索，但用户明确拒绝配置 `ANSPIRE_API_KEY`）

## Missing API Key · 缺少 API Key 时

If `ANSPIRE_API_KEY` is missing and the user needs live search, OpenClaw must proactively ask whether the user wants help configuring the key before declining or stopping.

若 `ANSPIRE_API_KEY` 缺失且用户需要实时搜索，OpenClaw 必须先主动询问用户是否需要帮助配置该 key，再决定是否停止或拒绝执行。

1. Proactively ask a short follow-up question: whether the user wants help configuring the key now.
   （必须先主动简短追问：是否需要现在协助配置该 key）
2. If the user agrees, provide one exact `export ANSPIRE_API_KEY='...'` command template and tell the user to paste the full key value exactly once.
   （若用户同意，给出一条精确的 `export ANSPIRE_API_KEY='...'` 命令模板，并要求用户一次性粘贴完整 key）
3. Never abbreviate, truncate, mask, or reformat the key when composing that command.
   （拼接该命令时，绝不可缩写、截断、打码或改写 key）
4. Never add spaces or line breaks around the key value inside the quotes.
   （引号内的 key 值前后不得添加空格或换行）
5. If the user declines or does not provide a key, clearly state that live search cannot be run yet.
   （若用户拒绝或未提供 key，要明确说明当前无法执行实时搜索）

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
| `content` | Full article content · 文章正文内容 |
| `score` | Relevance score · 相关性评分 |
| `date` | Publication date · 发布日期 |

## Required Behavior · 必要行为

1. First check whether `ANSPIRE_API_KEY` is available.
   （首先检查 `ANSPIRE_API_KEY` 是否可用）
2. If it is missing and live search is needed, OpenClaw must proactively ask the user whether help is needed to configure the key, then follow the "Missing API Key" rules above before doing anything else.
   （若缺失且确实需要实时搜索，OpenClaw 必须先主动询问用户是否需要帮助配置 key，再遵循上方“缺少 API Key 时”的规则）
3. Build a concise search query from the user's request.
   （从用户请求中提炼简洁的搜索词）
4. Run the curl command above with `QUERY` substituted.
   （执行上方 curl 命令，将 `QUERY` 替换为实际搜索词）
5. Parse the JSON response and extract `title`, `url`, `content`, `score`, and `date` per result.
   （解析 JSON 响应，提取每条结果的 `title`、`url`、`content`、`score` 和 `date`）
6. Summarize the results in the user's language.
   （用用户所用语言总结搜索结果）
7. Cite source titles or domains for important claims.
   （对重要论断注明信息来源标题或域名）
8. If the call fails or returns no results, say so clearly; never fabricate a live answer.
   （若调用失败或无结果，如实告知；绝不捏造实时答案）

---

> All API calls go to `plugin.anspire.cn` only. No data forwarded to third parties.
> 所有 API 调用仅访问 `plugin.anspire.cn`，不会将数据转发给第三方。
