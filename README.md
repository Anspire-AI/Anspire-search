# Anspire Search · Anspire 实时搜索

> The next-generation real-time intelligent search engine built for the AI ecosystem.
> 面向 AI 生态的下一代实时智能搜索引擎

An [OpenClaw](https://openclaw.ai) skill that brings [Anspire](https://aisearch.anspire.cn)'s real-time search directly into your AI agent — no browser, no scraping, one env var.

将 [Anspire](https://aisearch.anspire.cn) 实时搜索能力直接接入你的 AI 智能体——无需浏览器，无需爬虫，一个环境变量即可启用。

**MIT** · [![ClawHub](https://img.shields.io/badge/ClawHub-anspire--search-blue)](https://clawhub.ai/Anspire-AI/anspire-search) · [![Anspire](https://img.shields.io/badge/Powered%20by-Anspire-purple)](https://aisearch.anspire.cn)

---

## Why Anspire · 为什么选 Anspire

| Capability · 能力 | Description · 说明 |
|---|---|
| 🌐 全渠道内容捕捞 | Parallel crawling across major search engines, encyclopedias, news, and academic sources in real time · 并行捕捞主流搜索引擎、百科、新闻、学术资源 |
| 🧠 多模态内容检索 | Semantic parsing + cross-modal retrieval: text, images, video, news, flights, hotels · 语义解析 + 图文跨模态检索，覆盖文字、图片、新闻、机票酒店 |
| 🤖 智能体原生架构 | Native integration with Coze, Dify, 腾讯元器, 百炼 and more · 原生支持 Coze、Dify、腾讯元器、百炼等主流 AI 平台 |
| ⚡ 毫秒级知识更新 | Break through the information lag of traditional search systems · 突破传统搜索的信息滞后，实现毫秒级策略迭代 |
| 🔗 跨域信息融合与认知增强排序 | Parallel crawling via hybrid cluster + federated learning framework, covering encyclopedias, news, and academic sources in real time · 基于混合式集群与联邦学习框架，并行捕捞主流搜索引擎，实时覆盖百科、新闻资讯、学术资源等信息源 |

---

## Setup · 配置

Set your API key — that's the only step / 设置 API Key，这是唯一需要做的事：

```bash
export ANSPIRE_API_KEY=your_key_here
```

> Get your key at [aisearch.anspire.cn](https://aisearch.anspire.cn) · 在 [aisearch.anspire.cn](https://aisearch.anspire.cn) 注册获取

---

## Agent Usage · Agent 用法

Once installed, your OpenClaw agent automatically uses this skill when it needs live web information. The agent runs the search inline — no script path, no extra setup.

安装后，OpenClaw agent 在需要实时信息时会自动调用此 skill，agent 直接执行搜索，无需脚本路径，无需额外配置。

The underlying API call / 底层 API 调用：

```bash
curl --silent --show-error --fail --location --get \
  "https://plugin.anspire.cn/api/ntsearch/search" \
  --data-urlencode "query=QUERY" \
  --data-urlencode "top_k=10" \
  --header "Authorization: Bearer $ANSPIRE_API_KEY" \
  --header "Accept: application/json"
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

| Scenario · 场景 | Example · 示例 |
|---|---|
| 📰 Current events & news · 时事新闻 | "最新 AI 政策" / "latest US tech regulations" |
| 📈 Market & industry updates · 市场动态 | "今日 A 股行情" / "NVIDIA stock news" |
| 🔬 Research & fact-checking · 查证核实 | "2026年最新研究报告" / "recent climate data" |
| 🌍 Real-time facts · 实时事实 | "现在的 BTC 价格" / "current weather in Shanghai" |

---

## Requirements · 依赖

| Requirement | Details | 说明 |
|---|---|---|
| `ANSPIRE_API_KEY` | Required · 必填 | Get at [aisearch.anspire.cn](https://aisearch.anspire.cn) |
| `curl` | Required · 必填 | Pre-installed on macOS/Linux · macOS/Linux 预装 |
| `python3` | Optional · 可选 | For CLI formatted output · 用于命令行格式化输出 |

---


## License · 许可证

MIT © [Anspire-AI](https://github.com/Anspire-AI) · [aisearch.anspire.cn](https://aisearch.anspire.cn)
