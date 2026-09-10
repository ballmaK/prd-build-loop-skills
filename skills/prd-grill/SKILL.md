---
name: prd-grill
description: >-
  Stress-test modular PRD under docs/prd/ with grill-me/grilling discipline until
  shared understanding, grill sign-off, and PRD-derived E2E cases. Use when user
  says /prd-grill, wants to challenge/finalize PRD before build, or
  prd-build-loop blocks on missing grill-signoff / e2e-cases.
disable-model-invocation: true
---

# PRD Grill

> **Trigger:** Challenge modular PRD **before** `/prd-build-loop` generates tasks or implements code.
>
> Inspired by [mattpocock/skills `grill-me`](https://github.com/mattpocock/skills/tree/main/skills/productivity/grill-me) → reusable [`grilling`](https://github.com/mattpocock/skills/tree/main/skills/productivity/grilling).

Run a **`/grilling`** session scoped to this project's PRD. Do **not** implement features. Do **not** generate `active-plan.md` checkboxes.

---

## Phase 0 — Load context

Verify:

| Check | Path |
| ----- | ---- |
| Macro PRD | `docs/prd/00-macro-shared.md` |
| Module PRDs | `docs/prd/modules/M*.md` |
| Dev order (if present) | `docs/prd/README.md` |

If missing, **STOP** and tell the user to run **`/prd-author`** first (generate modular PRD from the idea).

Read macro + module list. Skim module acceptance criteria headings. Prefer codebase facts over questions (same rule as `grilling`).

---

## Phase 1 — Grilling loop (core)

Apply **`grilling`** discipline exactly:

1. Interview relentlessly about every aspect of the **PRD / product plan** until shared understanding.
2. Walk each branch of the decision tree; resolve dependencies one-by-one.
3. For each question, **provide your recommended answer**.
4. Ask **one question at a time**; wait for feedback before the next.
5. If a *fact* is in the repo (code, existing docs), look it up — do not ask.
6. *Decisions* belong to the user — put each one to them and wait.
7. **Do not** start implementation or task generation until they confirm shared understanding.

### PRD decision tree (walk in order; skip only if already crystal-clear in docs)

Use these branches as the agenda — still **one question at a time**, not a dump:

1. **Outcome & non-goals** — what success looks like; what we explicitly will not build
2. **Users & critical journeys** — who, happy path, must-not-fail paths
3. **Module boundaries** — ownership, shared vs module-local, circular deps
4. **Acceptance criteria** — per module: testable, unambiguous, missing edges
5. **Data & contracts** — entities, invariants, API/event boundaries
6. **Development order** — prerequisites, what can parallelize, what must serialize
7. **Risks & unknowns** — auth, migrations, external systems, launch constraints
8. **Definition of done** — task / module / release bars for the coming build loop
9. **E2E journey candidates** — which AC must be proven end-to-end (vs unit-only)

When a gap is found, prefer: **recommend a concrete PRD edit** → wait for user OK → apply minimal edit to the relevant `docs/prd/**` file → continue grilling.

---

## Phase 2 — Sign-off

Only after the user **explicitly confirms** shared understanding:

1. Create or update `docs/prd/grill-signoff.md` from the template shape below (or copy from skill templates if present in the installed package).
2. Summarize resolved decisions and remaining accepted risks.
3. Proceed to **Phase 3** (E2E cases) before telling the user build-loop is ready.

### Sign-off file requirements

Path: `docs/prd/grill-signoff.md`

Must include:

- Date / session note
- Confirmation that grilling reached shared understanding
- Short list of decisions locked in this session
- Pointers to PRD paths that were updated (if any)
- Explicit line: `status: approved`

If the user declines approval, leave no `approved` sign-off (or set `status: draft`) and **STOP**. Do not write E2E cases until approved.

---

## Phase 3 — Author E2E cases from PRD

**Required after** `grill-signoff` is `approved`. Still **no product implementation**.

1. Copy `templates/docs/prd/e2e-cases.md` → `docs/prd/e2e-cases.md` if missing.
2. Walk each module PRD’s acceptance criteria and macro critical journeys.
3. Emit concrete E2E cases:
   - One case = one user-visible journey
   - Map to source AC / module path
   - Steps + expected results must be externally observable
   - Mark `Automation: pending`
4. Prefer **P0 journeys first**; list explicit deferrals for AC that stay unit-only.
5. Set YAML `status: ready` when the coverage checklist is honest (deferrals allowed if listed).
6. Tick the E2E checkbox on `grill-signoff.md`.

### Quality bar

- Vague AC (“works correctly”) → fix the PRD or refine the case before `ready`
- No silent skips: every P0 AC maps to a case **or** a deferred row
- Do not invent features that are not in the PRD

### Handoff line

Tell the user next steps:

```
/prd-build-loop
```

Build-loop will implement tasks with TDD, then in Phase 4 automate/run these E2E cases.

---

## Resume

```
/prd-grill continue
```

Continue the decision tree from the last unresolved branch; do not re-ask settled questions unless the user changed the PRD.

If sign-off is already `approved` but `docs/prd/e2e-cases.md` is missing or `draft`, resume at **Phase 3** only:

```
/prd-grill e2e
```

---

## User invocation

```
/prd-grill
```

Optional focus:

```
/prd-grill on module M02 auth
```
