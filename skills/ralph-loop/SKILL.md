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

If grill is approved but `docs/prd/e2e-cases.md` is missing / not `ready`, run **`/prd-grill e2e`**.

As-Is only (no To-Be/migrate plan) → do **not** start build-loop yet.

Then invoke **`prd-build-loop`** or **`prd-build-loop continue`** in new Agent sessions.
After all checkboxes are done, use **`prd-build-loop e2e`** if Phase 4 E2E was skipped.

Optional semi-attended harness:

```bash
./scripts/ralph.sh
```

## Stop

```bash
touch .ralph-stop
```

Human ON the loop, not IN the loop.
