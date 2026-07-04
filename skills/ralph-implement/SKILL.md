---
name: ralph-implement
description: Execute ONE task from active-plan.md — core Ralph loop iteration. Fresh context, one checkbox, tests, exit. Use each loop iteration.
---

# Ralph Implement

Execute **exactly ONE** unchecked task from `specs/implementation-plans/active-plan.md`.

## Steps

1. Read `specs/README.md` (Pin only)
2. Find **first** `- [ ]` in active-plan.md
3. Search Pin for related patterns
4. Read `CONTEXT.md` and linked `docs/prd/modules/*.md`
5. Apply **`tdd`** — red → green, one vertical slice
6. Run `./test-wrapper.sh`
7. Pass → mark `[x]`; fail 3× → leave `[ ]`
8. **STOP** unless `prd-build-loop` session budget allows continue

One goal. One context window. Compaction is the devil.
