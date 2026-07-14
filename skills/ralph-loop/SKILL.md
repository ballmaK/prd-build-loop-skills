---
name: ralph-loop
description: Launch and manage the Ralph outer harness loop. Use when running multi-iteration implementation from active-plan.md in Cursor.
disable-model-invocation: true
---

# Ralph Loop

## Cursor mode

If modular PRD is missing, run **`/prd-author`** first.

If PRD exists but is not grill-approved yet, run **`/prd-grill`**.

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
