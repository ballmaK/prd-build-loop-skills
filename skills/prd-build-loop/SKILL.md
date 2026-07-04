---
name: prd-build-loop
description: >-
  After finalized modular PRD in docs/prd/, convert to Ralph implementation plan
  and autonomously execute all tasks until complete. Combines setup-matt-pocock-skills,
  to-issues, ralph-init, ralph-implement, and tdd. Use when user says PRD is finalized,
  /prd-build-loop, or wants to implement entire PRD automatically.
disable-model-invocation: true
---

# PRD Build Loop

> **Trigger:** User has **finalized** modular PRD under `docs/prd/` and wants all tasks implemented autonomously.

Orchestrates: `setup-matt-pocock-skills` → PRD→Plan → `ralph-implement` × N → done.

---

## Phase 0 — Preconditions

Verify before starting:

| Check | Path / Action |
| ----- | ------------- |
| Macro PRD exists | `docs/prd/00-macro-shared.md` |
| Module PRDs exist | `docs/prd/modules/M*.md` |
| User confirmed finalized | Ask once if not stated |
| Git clean or committed | Recommend commit before loop |

If missing, **STOP** and tell user to finish PRD first.

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

### 2.3 Update Pin in `specs/README.md`

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

## Phase 4 — Completion

When no `- [ ]` remain: run tests, update `specs/current-state.md`, summarize.

---

## Resume

```
/prd-build-loop continue
```

---

## User invocation

```
/prd-build-loop
```
