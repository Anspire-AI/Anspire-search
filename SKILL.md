---
name: anspire-search
description: "Anspire Search: real-time web search for news, events & time-sensitive facts. Use scripts/search.py (Python) or scripts/search.sh (shell) for easy execution. Requires ANSPIRE_API_KEY env var. Calls plugin.anspire.cn only."
metadata: {"openclaw":{"emoji":"🔎","requires":{"anyBins":["curl","python3"]}}}
---
# Anspire Search · Anspire 实时搜索

Real-time web search via the Anspire Search API. No browser, no npm, no setup beyond one env var.

通过 Anspire 搜索 API 进行实时网络搜索。无需浏览器，无需安装依赖，只需设置一个环境变量。

## Setup · 配置

**Persistent setup (recommended) / 持久化配置（推荐）：**

Add to your shell config file so it persists across sessions / 添加到 shell 配置文件以便跨会话保持：

```bash
# For zsh (macOS default) / zsh 用户（macOS 默认）
echo 'export ANSPIRE_API_KEY="your_exact_full_key_here"' >> ~/.zshrc
source ~/.zshrc

# For bash / bash 用户
echo 'export ANSPIRE_API_KEY="your_exact_full_key_here"' >> ~/.bashrc
source ~/.bashrc
```

**Temporary setup (current session only) / 临时配置（仅当前会话）：**

```bash
export ANSPIRE_API_KEY='your_exact_full_key_here'
```

> ⚠️ Temporary config is lost when you close the terminal or start a new chat. Use persistent setup to avoid reconfiguring.
> 
> ⚠️ 临时配置在关闭终端或新开聊天时会丢失。使用持久化配置可避免重复设置。

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

If `ANSPIRE_API_KEY` is missing and the user needs live search:

若 `ANSPIRE_API_KEY` 缺失且用户需要实时搜索：

1. Ask a short follow-up question: whether the user wants help configuring the key now.
   （先简短追问：是否需要现在协助配置该 key）
2. If the user agrees, provide one exact `export ANSPIRE_API_KEY='...'` command template and tell the user to paste the full key value exactly once.
   （若用户同意，给出一条精确的 `export ANSPIRE_API_KEY='...'` 命令模板，并要求用户一次性粘贴完整 key）
3. Never abbreviate, truncate, mask, or reformat the key when composing that command.
   （拼接该命令时，绝不可缩写、截断、打码或改写 key）
4. Never add spaces or line breaks around the key value inside the quotes.
   （引号内的 key 值前后不得添加空格或换行）
5. If the user declines or does not provide a key, clearly state that live search cannot be run yet.
   （若用户拒绝或未提供 key，要明确说明当前无法执行实时搜索）

## How to Search · 执行搜索

### Option 1: Use the Python wrapper (Recommended) · 使用 Python 封装（推荐）

```bash
python scripts/search.py "your search query" --top-k 10
```

For JSON output / 输出 JSON 格式：
```bash
python scripts/search.py "your search query" --json
```

### Option 2: Use the shell script · 使用 Shell 脚本

```bash
./scripts/search.sh "your search query" 10
```

### Option 3: Direct curl command · 直接使用 curl 命令

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
2. If it is missing and live search is needed, follow the “Missing API Key” rules above before doing anything else.
   （若缺失且确实需要实时搜索，必须先遵循上方”缺少 API Key 时”的规则）
3. Build a concise search query from the user's request.
   （从用户请求中提炼简洁的搜索词）
4. **Use the Python wrapper script** (`scripts/search.py`) for best results. It handles errors, formats output, and provides both human-readable and JSON modes.
   （**使用 Python 封装脚本**（`scripts/search.py`）以获得最佳效果。它处理错误、格式化输出，并提供人类可读和 JSON 两种模式）
5. Parse the JSON response and extract `title`, `url`, `content`, `score`, and `date` per result.
   （解析 JSON 响应，提取每条结果的 `title`、`url`、`content`、`score` 和 `date`）
6. Summarize the results in the user's language.
   （用用户所用语言总结搜索结果）
7. Cite source titles or domains for important claims.
   （对重要论断注明信息来源标题或域名）
8. If the call fails or returns no results, say so clearly; never fabricate a live answer.
   （若调用失败或无结果，如实告知；绝不捏造实时答案）

## File Structure · 文件结构

```
skills/anspire-search/
├── SKILL.md              # This documentation / 本文档
├── .env.example          # Example environment file / 环境变量示例
├── scripts/
│   ├── search.py         # Python wrapper (recommended) / Python 封装（推荐）
│   └── search.sh         # Shell wrapper / Shell 封装
├── README.md             # English README
└── README_CN.md          # Chinese README
```

---

> All API calls go to `plugin.anspire.cn` only. No data forwarded to third parties.
> 所有 API 调用仅访问 `plugin.anspire.cn`，不会将数据转发给第三方。
