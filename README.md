<div align="center">

**[English](#english-version)** | [中文](#中文版本)

</div>

---

<a name="english-version"></a>

# Anspire Search

> The next-generation real-time intelligent search engine built for the AI ecosystem.

An [OpenClaw](https://openclaw.ai) skill that brings [Anspire](https://aisearch.anspire.cn)'s real-time search directly into your AI agent — no browser, no scraping, one env var.

**MIT** · [![ClawHub](https://img.shields.io/badge/ClawHub-anspire--search-blue)](https://clawhub.ai/Anspire-AI/anspire-search) · [![Anspire](https://img.shields.io/badge/Powered%20by-Anspire-purple)](https://aisearch.anspire.cn)

### Why Anspire?

| Capability | Description |
|---|---|
| 🌐 Omni-channel Crawling | Parallel crawling across major search engines, encyclopedias, news, and academic sources in real time |
| 🧠 Multimodal Retrieval | Semantic parsing + cross-modal retrieval: text, images, video, news, flights, hotels |
| 🔗 Cross-domain Fusion & Cognitive Ranking | Hybrid cluster + federated learning framework for real-time indexing across encyclopedias, news, and academic resources |
| 🤖 Agent-native Architecture | Native integration with Coze, Dify, 腾讯元器, 百炼 and more |
| ⚡ Millisecond Knowledge Updates | Break through the information lag of traditional search systems |

### Setup

Set your API key — that's the only step:

```bash
export ANSPIRE_API_KEY=your_key_here
```

> Get your key at [aisearch.anspire.cn](https://aisearch.anspire.cn)

### Agent Usage

Once installed, your OpenClaw agent automatically uses this skill when it needs live web information. No script, no extra setup.

The underlying API call:

```bash
curl --silent --show-error --fail --location --get \
  "https://plugin.anspire.cn/api/ntsearch/search" \
  --data-urlencode "query=QUERY" \
  --data-urlencode "top_k=10" \
  --header "Authorization: Bearer $ANSPIRE_API_KEY" \
  --header "Accept: application/json"
```

### Output Format

```
--- Result 1 ---
Title: Page Title
Link: https://example.com/page
Snippet: Description from search results

--- Result 2 ---
...
```

### When to Use

| Scenario | Example |
|---|---|
| 📰 Current events & news | "latest US tech regulations" |
| 📈 Market & industry updates | "NVIDIA stock news today" |
| 🔬 Research & fact-checking | "recent climate research 2026" |
| 🌍 Real-time facts | "current weather in Shanghai" |

### Requirements

| Requirement | Details |
|---|---|
| `ANSPIRE_API_KEY` | Required — get at [aisearch.anspire.cn](https://aisearch.anspire.cn) |
| `curl` | Required — pre-installed on macOS/Linux |

### License

MIT © [Anspire-AI](https://github.com/Anspire-AI) · [aisearch.anspire.cn](https://aisearch.anspire.cn)

---

<a name="中文版本"></a>

# Anspire 实时搜索

> 面向 AI 生态的下一代实时智能搜索引擎

一个 [OpenClaw](https://openclaw.ai) Skill，将 [Anspire](https://aisearch.anspire.cn) 实时搜索能力直接接入你的 AI 智能体——无需浏览器，无需爬虫，一个环境变量即可启用。

**MIT** · [![ClawHub](https://img.shields.io/badge/ClawHub-anspire--search-blue)](https://clawhub.ai/Anspire-AI/anspire-search) · [![Anspire](https://img.shields.io/badge/Powered%20by-Anspire-purple)](https://aisearch.anspire.cn)

### 为什么选 Anspire？

| 能力 | 说明 |
|---|---|
| 🌐 全渠道内容捕捞 | 并行捕捞主流搜索引擎、百科、新闻资讯、学术资源，实时抓取 |
| 🧠 多模态内容检索 | 语义解析 + 图文跨模态关联检索，覆盖文字、图片、新闻、机票酒店 |
| 🔗 跨域信息融合与认知增强排序 | 基于混合式集群与联邦学习框架，并行捕捞主流搜索引擎，实时覆盖百科、新闻资讯、学术资源等信息源 |
| 🤖 智能体原生架构 | 原生支持 Coze、Dify、腾讯元器、百炼等主流 AI 平台，即插即用 |
| ⚡ 毫秒级知识更新 | 突破传统搜索系统的信息滞后瓶颈，实现毫秒级的知识更新与策略迭代 |

### 配置

设置 API Key，这是唯一需要做的事：

```bash
export ANSPIRE_API_KEY=your_key_here
```

> 在 [aisearch.anspire.cn](https://aisearch.anspire.cn) 注册获取 API Key

### Agent 用法

安装后，OpenClaw agent 在需要实时信息时会自动调用此 Skill，无需脚本路径，无需额外配置。

底层 API 调用：

```bash
curl --silent --show-error --fail --location --get \
  "https://plugin.anspire.cn/api/ntsearch/search" \
  --data-urlencode "query=搜索词" \
  --data-urlencode "top_k=10" \
  --header "Authorization: Bearer $ANSPIRE_API_KEY" \
  --header "Accept: application/json"
```

### 输出格式

```
--- Result 1 ---
Title: 页面标题
Link: https://example.com/page
Snippet: 搜索结果摘要

--- Result 2 ---
...
```

### 使用时机

| 场景 | 示例 |
|---|---|
| 📰 时事新闻 | "最新 AI 政策" / "今日科技头条" |
| 📈 市场动态 | "今日 A 股行情" / "比特币最新价格" |
| 🔬 查证核实 | "2026 年最新研究报告" |
| 🌍 实时事实 | "上海今天天气" / "现在几点" |

### 依赖

| 依赖 | 说明 |
|---|---|
| `ANSPIRE_API_KEY` | 必填——在 [aisearch.anspire.cn](https://aisearch.anspire.cn) 注册获取 |
| `curl` | 必填——macOS/Linux 预装 |

### 许可证

MIT © [Anspire-AI](https://github.com/Anspire-AI) · [aisearch.anspire.cn](https://aisearch.anspire.cn)
