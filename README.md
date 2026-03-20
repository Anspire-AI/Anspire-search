<div align="center">

**English** | [中文](./README_CN.md)

</div>

---

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

```json
{
  "results": [
    {
      "title": "Page Title",
      "url": "https://example.com/page",
      "content": "Full article content...",
      "score": 0.997,
      "date": "2026-03-10T10:10:00+08:00"
    }
  ]
}
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
