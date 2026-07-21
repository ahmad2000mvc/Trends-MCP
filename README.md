<div align="center">

<img src="https://www.trendsmcp.ai/static/pages/trendsmcp/assets/trend.svg" width="72" alt="Trends MCP logo">

# Trends MCP

**Live trend data for your AI. 25+ platforms. One connection.**

Google Search · YouTube · TikTok · Reddit · Amazon · Wikipedia · X · News sentiment · App Store · npm · Steam · GitHub · Spotify · and more

[![MCP](https://img.shields.io/badge/MCP-compatible-blue)](https://modelcontextprotocol.io)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Smithery](https://img.shields.io/badge/Smithery-listed-8A2BE2)](https://smithery.ai/servers/trendsmcp/trends-mcp)
[![API calls served](https://img.shields.io/badge/API%20calls%20served-4.1M%2B-brightgreen)](https://trendsmcp.ai)
[![Free tier](https://img.shields.io/badge/Free%20tier-100%20req%2Fmo-orange)](https://trendsmcp.ai?utm_source=github&utm_medium=readme&utm_campaign=badges)
[![GitHub stars](https://img.shields.io/github/stars/trendsmcp/trends-mcp?style=social)](https://github.com/trendsmcp/trends-mcp/stargazers)

[**Get a free API key →**](https://trendsmcp.ai?utm_source=github&utm_medium=readme&utm_campaign=hero) &nbsp;·&nbsp; [Docs](https://trendsmcp.ai/docs) &nbsp;·&nbsp; [Data Sources](https://tren[...]

<img width="1841" alt="Trends MCP — live trend data across 25+ platforms" src="https://github.com/user-attachments/assets/e50e3025-cbdf-4f08-b0df-c1219e237f31" />

<!-- UPGRADE: replace the static screenshot above with a <20s demo GIF (convert the R2 .mov of
     Claude calling TrendsMCP). Animated hero > static hero for conversion. -->

</div>

---

## Why this exists

Your AI has a training cutoff. The world doesn't.

```
You: "Using TrendsMCP, compare 6-month growth for 'GLP-1' across Google, TikTok and Amazon."

Claude: GLP-1 momentum, last 6 months:
  Google Search  +84%  (accelerating)
  TikTok         +212% (breakout)
  Amazon         +61%  (steady)
```

One MCP endpoint replaces per-platform API keys, brittle scrapers (looking at you, pytrends), and $500/mo dashboard tools. Everything comes back as normalized 0–100 JSON your AI can reason over [...]

| Problem | Trends MCP solution |
|---------|---------------------|
| AI has a training cutoff — it doesn't know what's trending today | Live data from 25+ sources, queried at request time |
| Separate keys and APIs for TikTok, Reddit, YouTube, Amazon… | One MCP endpoint, one key, consistent schema |
| pytrends scrapes Google and breaks constantly | Managed pipeline with retries, no scraping |
| Trend data comes back as charts you read manually | Structured JSON your AI reasons over directly |
| Expensive enterprise dashboards just for trend signals | Free tier, no dashboard, no per-seat pricing |

<img width="400" alt="Trends MCP in action" src="https://github.com/user-attachments/assets/6ff0e7ae-7f2d-460f-9a1c-5fd542d7fb77" />

## Quickstart (30 seconds)

**1.** Grab a free API key at [trendsmcp.ai](https://trendsmcp.ai?utm_source=github&utm_medium=readme&utm_campaign=quickstart) — 100 requests/mo, no credit card.

**2.** One-click install:

[<img src="https://cdn.simpleicons.org/claude/DA7756" width="14"> **Add to Claude**](https://claude.ai/customize/connectors?modal=add-custom-connector&connectorName=Trends%20MCP&connectorUrl=https[...]

Or paste the config:

<details open>
<summary><b>Cursor / Windsurf / Cline</b> — <code>~/.cursor/mcp.json</code></summary>

```json
{
  "mcpServers": {
    "trends-mcp": {
      "url": "https://api.trendsmcp.ai/mcp",
      "transport": "http",
      "headers": { "Authorization": "Bearer YOUR_API_KEY" }
    }
  }
}
```
</details>

<details>
<summary><b>VS Code / GitHub Copilot</b> — <code>.vscode/mcp.json</code></summary>

```json
{
  "servers": {
    "trends-mcp": {
      "type": "http",
      "url": "https://api.trendsmcp.ai/mcp",
      "headers": { "Authorization": "Bearer YOUR_API_KEY" }
    }
  }
}
```
</details>

<details>
<summary><b>Claude Desktop</b> — <code>claude_desktop_config.json</code></summary>

```json
{
  "mcpServers": {
    "trends-mcp": {
      "command": "npx",
      "args": [
        "-y", "mcp-remote",
        "https://api.trendsmcp.ai/mcp",
        "--header", "Authorization:${AUTH_HEADER}"
      ],
      "env": { "AUTH_HEADER": "Bearer YOUR_API_KEY" }
    }
  }
}
```
</details>

<!-- Environment variable setup added by Copilot -->

## Environment variable setup

For security, do NOT commit your API key into the repository. Create an API key at https://trendsmcp.ai and set it in your shell environment using:

```bash
export TRENDSMCP_API_KEY="your_api_key_here"
```

Important:

- Set the environment variable value to the API key only — do NOT include the "Bearer" prefix.
- The repository's `.mcp.json` is configured to add the `Bearer ` prefix automatically via: `"Authorization": "Bearer ${TRENDSMCP_API_KEY}"`.
- Do not print or log the API key in build logs, CI output, or commits.

**Example (Linux/macOS):**

```bash
# create the environment variable for the current shell session
export TRENDSMCP_API_KEY="your_api_key_here"

# verify you did NOT include the word Bearer
# (this will print a masked example; do NOT echo your real key in public logs)
echo "$TRENDSMCP_API_KEY"
```

<details>
<summary><b>Claude.ai (browser)</b> — Settings → Connectors → Add custom connector</summary>

```
https://www.trendsmcp.ai/mcp
```
</details>

**3.** Ask your AI:

```
Using TrendsMCP, what's trending on Google right now?
```

## The three tools

| Tool | What it does | Example |
|------|--------------|---------|
| `get_trends` | ~5 years of weekly history for a keyword, normalized 0–100 | `get_trends(keyword='electric vehicles', source='google search', data_mode='weekly')` |
| `get_growth` | % change over 7D–5Y, multi-source in one call | `get_growth(keyword='vibe coding', source='google search, tiktok, youtube', percent_growth=['3M','1Y'])` |
| `get_top_trends` | Live leaderboards — no keyword needed | `get_top_trends(type='TikTok Trending Hashtags', limit=20)` |

... (rest of README unchanged)
