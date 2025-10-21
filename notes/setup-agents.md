# Setup Agent AI

## Claude Code

```
claude mcp add --scope user codex codex mcp-server
```

```
claude mcp add --scope user playwright npx @playwright/mcp@latest
```

```
claude mcp add --scope user --transport http github https://api.githubcopilot.com/mcp -H "Authorization: Bearer $(echo $GITHUB_PAT_FOR_CLAUDE)"
```

```
claude mcp add serena -- uv run --directory ~/Workspace/serena/ serena start-mcp-server --context ide-assistant --project $(pwd)
```

## Codex

### config.toml

```
model = "gpt-5-codex"

[mcp_servers.github]
command = "mcp-proxy"
args = [
  "--transport",
  "streamablehttp",
  "-H",
  "Authorization",
  "Bearer <github_pat>",
  "https://api.githubcopilot.com/mcp/",
]

[mcp_servers.playwright]
command = "npx"
args = ["@playwright/mcp@latest"]
```
