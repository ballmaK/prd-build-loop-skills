---
name: prd-reverse
description: >-
  Reverse-engineer a legacy/brownfield codebase into modular As-Is PRD under
  docs/prd/as-is/. Use when user says /prd-reverse, wants PRD from existing code,
  legacy refactor docs, archaeology, or current-state requirements before redesign.
disable-model-invocation: true
---

# PRD Reverse (As-Is)

> **Trigger:** Brownfield / legacy codebase. Goal is a **faithful As-Is PRD**, not a greenfield vision doc.
>
> Downstream (later skills / sibling PRs): fidelity grill → To-Be grilling → strangler migrate plan → `/prd-build-loop`.
>
> Prefer composing [mattpocock/skills](https://github.com/mattpocock/skills): `research`, `domain-modeling`, `grilling`, optionally `improve-codebase-architecture`.

Do **not** implement refactors in this skill. Do **not** invent To-Be requirements unless labeled as **hypothesis**. Do **not** mark To-Be grill/build sign-off as approved.

---

## Phase 0 — Preconditions

| Check | Action |
| ----- | ------ |
| Codebase present | Non-empty app/src (or equivalent). If empty → hand off to greenfield `/prd-author` if available |
| Existing As-Is | If `docs/prd/as-is/` already populated, ask: **refresh**, **extend**, or **stop** |
| Scope | Ask once if missing: whole system vs named subsystems |

Recommend a clean git status / commit before archaeology notes land.

---

## Phase 1 — Archaeology (read the code, not the brochure)

Use **`/research`** discipline where helpful. Prefer primary sources: code, migrations, config, tests, runbooks.

Produce a working map (notes can live in `.scratch/reverse/` then promote):

1. **Runtime shape** — apps/services, entrypoints, deploy units
2. **Module candidates** — directories/packages that own a capability
3. **Critical journeys** — top user/API flows proven by handlers/routes/UI
4. **Data & contracts** — schemas, queues, external APIs, auth boundaries
5. **Implicit rules** — magic constants, cron jobs, feature flags, “don’t touch” zones
6. **Test reality** — what is actually covered vs claimed
7. **Pain signals** — duplicated logic, god modules, flaky areas (observe, don’t fix yet)

Rules:

- One clarifying **decision** question at a time if blocked; **facts** → look up in repo.
- Record **Unknowns** explicitly — never paper over with guesses.
- When guessing is unavoidable, mark `hypothesis:` and confidence `low|med`.

Optional: if installed, scan with **`/improve-codebase-architecture`** for deepening candidates; file them under known debt, do not start redesign here.

---

## Phase 2 — Domain seed

Run **`/domain-modeling`** lightly against what the code actually does:

- Create/update `CONTEXT.md` with ubiquitous language **as used in code**
- ADR only for irreversible observed constraints (e.g. multi-tenant keys), not wishlist design

---

## Phase 3 — Emit As-Is modular PRD

Create from templates (`templates/docs/prd/as-is/` when present):

| Path | Purpose |
| ---- | ------- |
| `docs/prd/as-is/README.md` | Index + observed ownership map |
| `docs/prd/as-is/00-system-map.md` | Macro as-is: journeys, shared invariants, runtime topology |
| `docs/prd/as-is/modules/MXX-<slug>.md` | One capability / ownership boundary |
| `docs/prd/as-is/known-debt.md` | Debt & risk inventory (no fix plans required yet) |
| `docs/prd/as-is/unknowns.md` | Open questions needing human/runtime proof |
| `docs/prd/as-is/reverse-signoff.md` | Fidelity sign-off (`status: draft` until Phase 4) |

**Each as-is module must include:**

- What it does **today** (behavior, not aspiration)
- Entry points / interfaces observed
- Data it owns or couples to
- Invariants / side effects
- Evidence pointers (paths, commands, tests) — keep stable; avoid ephemeral line numbers when possible
- Out-of-module dependencies
- Unknowns local to the module

Also seed `specs/current-state.md` with a short “as of DATE” summary if `specs/` exists (or will via `ralph-init`).

---

## Phase 4 — Fidelity check (As-Is grill)

Apply **`/grilling`** against the **As-Is docs vs code**:

Agenda (one question at a time):

1. Missing critical journeys?
2. Wrong module boundaries vs real ownership?
3. Undocumented side effects / batch jobs?
4. Over-claimed test coverage?
5. Silent couplings (shared DB tables, global state)?

When the user confirms the As-Is set is **faithful enough**:

- Set `docs/prd/as-is/reverse-signoff.md` → `status: approved`
- List residual accepted unknowns

If not approved → leave `draft`, keep unknowns, **STOP**.

---

## Phase 5 — Handoff (do not skip the ladder)

Tell the user the recommended next ladder:

1. **Characterization baseline** — lock today’s behavior with tests before changes (see note below)
2. **To-Be intent** — `/prd-author` or `grill-with-docs` + modular `docs/prd/` / `docs/prd/to-be/` (greenfield author skills if installed)
3. **Gap matrix** — keep / change / kill / rewrite per module
4. **Strangler plan** — future `/prd-migrate` (not in this skill yet)
5. **Build** — `/prd-build-loop` only on **To-Be / migrate tasks**, never treat As-Is alone as build input

### Characterization note (until a dedicated skill exists)

Before refactor tasks: add characterization tests around the seams you will touch; assert current external behavior; treat regressions as stop-the-line. Prefer existing test harness commands detected by `ralph-init`.

---

## Resume

```
/prd-reverse continue
```

Resume archaeology or fidelity grilling without rewriting settled modules unless code changed.

---

## User invocation

```
/prd-reverse
```

Scoped:

```
/prd-reverse on billing and auth only
```
