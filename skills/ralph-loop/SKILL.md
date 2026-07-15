---
name: ralph-loop
description: Launch and manage the Ralph outer harness loop. Use when running multi-iteration implementation from active-plan.md in Cursor.
disable-model-invocation: true
---

# Ralph Loop

## Cursor mode

If modular To-Be PRD is missing:

- Greenfield idea → run **`/prd-author`** first
- Brownfield codebase → run **`/prd-reverse`** first（As-Is only 还不能进 build）

If To-Be PRD exists but is not grill-approved yet, run **`/prd-grill`**.

As-Is only (no To-Be/migrate plan) → do **not** start build-loop yet.

Then invoke **`prd-build-loop`** or **`prd-build-loop continue`** in new Agent sessions.

Optional semi-attended harness:

```bash
./scripts/ralph.sh
```

## Stop

```bash
touch .ralph-stop
```

Human ON the loop, not IN the loop.
