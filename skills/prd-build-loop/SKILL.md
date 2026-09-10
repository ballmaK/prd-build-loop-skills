---
name: prd-build-loop
description: >-
  After finalized modular To-Be PRD in docs/prd/ (from /prd-author then /prd-grill,
  or brownfield To-Be after /prd-reverse), convert to Ralph implementation plan and
  autonomously execute all tasks until complete, then automate/run PRD E2E cases.
  Combines setup-matt-pocock-skills, prd-grill, to-issues, ralph-init,
  ralph-implement, and tdd. Use when user says PRD is finalized, /prd-build-loop,
  or wants to implement entire PRD automatically. If PRD missing, point to
  /prd-author or /prd-reverse. Never treat As-Is alone as backlog.
disable-model-invocation: true
---

# PRD Build Loop

> **Trigger:** User has **finalized** modular To-Be PRD under `docs/prd/` (after `/prd-grill`) and wants all tasks implemented autonomously.

Orchestrates: `prd-grill` (gate + E2E cases) → `setup-matt-pocock-skills` → PRD→Plan → `ralph-implement` × N → **E2E** → done.

---

## Phase 0 — Preconditions

Verify before starting:

| Check | Path / Action |
| ----- | ------------- |
| Macro PRD exists | `docs/prd/00-macro-shared.md` **or** agreed To-Be/migrate plan (not As-Is alone) |
| Module PRDs exist | `docs/prd/modules/M*.md` (or migrate task plan agreed with user) |
| Grill sign-off approved | `docs/prd/grill-signoff.md` with `status: approved` |
| E2E cases ready | `docs/prd/e2e-cases.md` with `status: ready` (or regenerate via `/prd-grill e2e`) |
| User confirmed finalized | Ask once if not stated |
| Git clean or committed | Recommend commit before loop |

If only `docs/prd/as-is/` exists (reverse output) and there is **no** To-Be / migrate plan:

1. **STOP** — As-Is is fidelity documentation, not an implementation backlog.
2. Tell the user to finish characterization + To-Be/gap/migrate planning first.
3. Point to **`/prd-reverse`** if As-Is is missing or unsigned.

If greenfield PRD files are missing entirely, **STOP** and tell user to run **`/prd-author`** first (or finish drafting modular PRD).

### Phase 0.5 — PRD grill gate

If `docs/prd/grill-signoff.md` is missing, or `status` is not `approved`:

1. **STOP** implementation and plan generation.
2. Tell the user to run **`/prd-grill`** (grill-me / `grilling` discipline on this PRD).
3. Optionally start `/prd-grill` in this session if the user asks to grill now.
4. After sign-off is `approved`, continue from Phase 0.6 (or `/prd-build-loop continue`).

Skip this gate only when the user explicitly says `skip grill` / `force build` (log that choice in `.ralph-logs/session.log`).

### Phase 0.6 — E2E cases gate

If `docs/prd/e2e-cases.md` is missing, or YAML `status` is not `ready`:

1. **STOP** plan generation / implementation (unless user says `skip e2e cases`).
2. Tell the user to run **`/prd-grill e2e`** (or full `/prd-grill` if sign-off also missing).
3. Optionally author/refresh E2E cases in this session from approved PRD, then set `status: ready`.
4. Log skips in `.ralph-logs/session.log`.

---

## Phase 1 — Bootstrap (first run only)

Skip any step whose outputs already exist.

### 1.1 Project setup

If `docs/agents/issue-tracker.md` missing → run **`setup-matt-pocock-skills`** logic:
- Issue tracker: **local markdown** → `.scratch/issues/`
- Triage labels: default five canonical roles
- Domain docs: `CONTEXT.md` + `docs/adr/`

### 1.2 Ralph scaffold

If `specs/implementation-plans/` missing → run **`ralph-init`** logic:
- Create `specs/`, `prompts/`, copy templates from prd-build-loop-skills `templates/` if available
- Create `.ralph-security` (confirm environment blast radius with user)
- Seed `specs/README.md` Pin from `docs/prd/00-macro-shared.md` module list

### 1.3 Domain glossary seed

If `CONTEXT.md` missing, create from PRD entities in macro/shared module docs.

---

## Phase 2 — PRD → Implementation Plan

**Only run if** `specs/implementation-plans/active-plan.md` is template-only OR user says `regenerate plan`.

### 2.1 Read development order

From `docs/prd/README.md` → Recommended development order.

### 2.2 Generate tasks

For each module in order, read `docs/prd/modules/M*.md` and emit **vertical slice** checkboxes into `active-plan.md`.

Rules:
- One checkbox = one `ralph-implement` iteration (2–4 hours max)
- Reference module PRD path in task text
- Use domain terms from `CONTEXT.md`
- No horizontal tasks ("write all tests")
- **Do not** turn the whole E2E suite into early plan tasks — unit/integration TDD stays per slice; full E2E runs in Phase 4

### 2.3 Update Pin in `specs/README.md`

Pin should mention `docs/prd/e2e-cases.md`.

### 2.4 Optional: run **`to-issues`** → `.scratch/issues/`

**Source of truth:** checkbox state in `active-plan.md`.

---

## Phase 3 — Autonomous Build Loop

### Loop rules

1. **ONE task per iteration** — `ralph-implement` discipline
2. **Always use `tdd`** for code tasks
3. Read only: Pin, active-plan, current module PRD, files you touch
4. Max **3** test-fix attempts; then leave `[ ]` and log
5. **Session budget:** max **5 tasks** per session → **`handoff`** → suggest `prd-build-loop`
6. **Stop:** `.ralph-stop` file
7. **Commit** after each task: `git commit -m "ralph: [summary]"`

Log to `.ralph-logs/session.log`.

---

## Phase 4 — Completion + E2E

When no `- [ ]` remain in `active-plan.md`:

### 4.1 Unit / suite sanity

Run the project test command (via `./test-wrapper.sh` if present). Fix regressions before E2E.

### 4.2 Automate PRD E2E cases

Read `docs/prd/e2e-cases.md`:

1. Prefer the project’s existing E2E stack (Playwright / Cypress / Detox / HTTP API e2e / etc.).
2. If none exists, add the **smallest** stack that can assert the P0 journeys (document the choice in `specs/conventions/testing.md` if present).
3. Implement automated tests mapped to case IDs (`E2E-01`, …). Keep selectors/contracts resilient; no fragile absolute file paths from PRD.
4. Mark each case `Automation:` → `implemented` (or `manual-only` with reason).

### 4.3 Run E2E and record results

1. Run the E2E suite.
2. Fill **Execution log** in `docs/prd/e2e-cases.md` (pass / fail / blocked).
3. Set YAML `status: executed`.
4. On P0 failure: **do not** declare the build loop done — leave failing cases listed, fix or open follow-up tasks in `active-plan.md`, log in `.ralph-logs/session.log`.
5. On deferred / blocked infra: record honestly; ask user whether to accept residual risk.

### 4.4 Wrap up

Update `specs/current-state.md`, summarize modules shipped + E2E results, suggest commit.

---

## Resume

```
/prd-build-loop continue
```

If implementation is complete but E2E not executed:

```
/prd-build-loop e2e
```

Jump to Phase 4.

---

## User invocation

```
/prd-build-loop
```
