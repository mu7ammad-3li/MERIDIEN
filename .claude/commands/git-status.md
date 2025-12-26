---
description: Show git status and recent changes
allowed-tools: Bash
---

Show the current git status and recent changes.

## Current Status

```bash
cd /media/muhammad/Work/Identity/BM/MERIDIEN
git status
```

## Recent Commits

```bash
git log --oneline -10
```

## Changed Files (Unstaged)

```bash
git diff --name-only
```

## Changed Files (Staged)

```bash
git diff --cached --name-only
```

## Show Diff

```bash
git diff
```
