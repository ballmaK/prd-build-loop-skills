---
name: prd-author
description: >-
  Author modular PRD under docs/prd/ from a rough idea: grill-with-docs
  (grilling + domain-modeling), synthesize like to-spec, then emit
  00-macro-shared.md + modules/M*.md. Use when user says /prd-author, has no PRD
  yet, wants to generate modular PRD, or prd-grill/prd-build-loop says PRD missing.
disable-model-invocation: true
---

# PRD Author

> **Trigger:** User has a **rough idea / problem statement**, not a finished modular PRD.
>
> Upstream of `/prd-grill` and `/prd-build-loop`.
>
> Composes [mattpocock/skills](https://github.com/mattpocock/skills):
> `grill-with-docs` (`grilling` + `domain-modeling`) → synthesize like `to-spec` → **modular** `docs/prd/`.

Do **not** implement product code. Do **not** generate `active-plan.md` checkboxes. Do **not** set `grill-signoff` to `approved` (that is `/prd-grill`).

---

## Phase 0 — Preconditions

| Check | Action |
| ----- | ------ |
| Idea stated | If missing, ask once: problem / who / success look like |
| Existing PRD | If `docs/prd/modules/` already has real modules, ask: **regenerate**, **extend**, or **handoff to `/prd-grill`** |
| Setup (optional) | If `CONTEXT.md` / issue-tracker setup missing, offer `/setup-matt-pocock-skills` |

If user only wants to stress-test an existing PRD → hand off to **`/prd-grill`**.

---

## Phase 1 — Discover (grill-with-docs)

Run a **`/grill-with-docs`** session (i.e. `/grilling` + `/domain-modeling`):

1. One question at a time; recommended answer each time.
2. Facts from the repo → look up; decisions → ask the user.
3. Keep updating `CONTEXT.md` and ADRs under `docs/adr/` as terms/decisions lock.
4. Walk these branches (skip only if already solid):

   1. Problem & outcome
   2. Non-goals
   3. Users & critical journeys
   4. Domain entities & ubiquitous language
   5. Module boundaries (shared vs module-local)
   6. Contracts / data / auth constraints
   7. Acceptance sketch per module
   8. Suggested development order
   9. Risks & open questions

**Stop Phase 1** only when the user confirms shared understanding enough to write PRD files.

---

## Phase 2 — Synthesize (to-spec discipline → modular files)

Like **`/to-spec`**: **do not interview here** — synthesize what was already decided.

### 2.1 Confirm seams / modules with the user

List proposed modules (IDs + one-line responsibility). Prefer few deep modules. Get explicit OK before writing files.

### 2.2 Write modular PRD

Create or refresh (from templates under `templates/docs/prd/` when available):

| Path | Content |
| ---- | ------- |
| `docs/prd/README.md` | Index + **Recommended development order** |
| `docs/prd/00-macro-shared.md` | Product outcome, non-goals, shared entities, cross-cutting constraints |
| `docs/prd/modules/MXX-<slug>.md` | One vertical module each |

**Each module file must include at least:**

- Purpose / ownership boundary
- In scope / out of scope
- User stories (extensive where material)
- Acceptance criteria (testable)
- Implementation notes (modules/interfaces/contracts — **no fragile file paths**)
- Testing notes (behavior seams)
- Dependencies on other modules

**Macro file must include at least:**

- Problem & solution summary
- Shared glossary pointers (`CONTEXT.md`)
- Cross-module invariants
- Non-goals
- Global risks

Use domain vocabulary from `CONTEXT.md` throughout.

### 2.3 Draft placeholders only

- Copy `templates/docs/prd/grill-signoff.md` → `docs/prd/grill-signoff.md` with `status: draft` if missing.
- Do **not** approve sign-off.

---

## Phase 3 — Handoff

1. Summarize modules + suggested order.
2. Tell the user next step:

```
/prd-grill
```

(optional then `/prd-build-loop`)

3. If session is long, offer `/handoff`.

---

## Resume

```
/prd-author continue
```

Resume discovery or synthesis from the last incomplete phase. Do not re-ask settled decisions unless the user changed direction.

---

## User invocation

```
/prd-author
```

With a seed idea:

```
/prd-author 我们要做一个团队周报自动汇总工具
```
