# Anspire Search · Anspire 实时搜索

Real-time web search via the [Anspire Search API](https://plugin.anspire.cn). Lightweight, no browser required.

通过 [Anspire 搜索 API](https://plugin.anspire.cn) 进行实时网络搜索。轻量级，无需浏览器。

**MIT** · [![ClawHub](https://img.shields.io/badge/ClawHub-anspire--search-blue)](https://clawhub.ai/Anspire-AI/anspire-search)

---

## Setup · 配置

**Set your API key / 设置 API Key：**

```bash
export ANSPIRE_API_KEY=your_key_here
```

**Make the script executable (first time only) / 首次使用前赋予执行权限：**

```bash
chmod +x search.sh
```

---

## Usage · 用法

```bash
./search.sh "query"          # Basic search, 10 results · 基础搜索，返回 10 条
./search.sh "query" -n 5     # Limit to 5 results · 限制返回 5 条
./search.sh -h               # Show help · 显示帮助
```

---

## Output Format · 输出格式

```
--- Result 1 ---
Title: Page Title
Link: https://example.com/page
Snippet: Description from search results

--- Result 2 ---
...
```

---

## When to Use · 使用时机

| English | 中文 |
|---------|------|
| Searching for recent news, current events, or policy changes | 搜索近期新闻、时事或政策变动 |
| Verifying up-to-date facts or documentation | 核实最新事实或文档 |
| Looking up information that changes frequently over time | 查询随时间频繁变化的信息 |
| Any query that requires live internet access | 任何需要实时联网的查询 |

---

## Requirements · 依赖

| Requirement | Details | 说明 |
|-------------|---------|------|
| `ANSPIRE_API_KEY` | Required env var | 必填，Anspire API Key |
| `curl` | Pre-installed on macOS/Linux | macOS/Linux 预装 |
| `python3` | Optional, for formatted output | 可选，用于格式化输出 |

---

## API

Powered by [Anspire](https://plugin.anspire.cn) — a real-time web search API. All calls go to `plugin.anspire.cn` only.

由 [Anspire](https://plugin.anspire.cn) 驱动——实时网络搜索 API。所有调用仅访问 `plugin.anspire.cn`，不转发给第三方。

| Parameter | Type | Description | 说明 |
|-----------|------|-------------|------|
| `query` | string | The search query string | 搜索关键词 |
| `top_k` | int | Number of results (default: 10) | 返回结果数（默认 10） |

---

## License · 许可证

MIT © [Anspire-AI](https://github.com/Anspire-AI)
