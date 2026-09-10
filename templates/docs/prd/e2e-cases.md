# E2E Cases (from PRD)

> Authored by `/prd-grill` **after** `grill-signoff` is `approved`.  
> Executed / automated by `/prd-build-loop` **Phase 4** when all plan tasks are done.  
> These are **end-to-end journeys** derived from modular PRD acceptance criteria — not unit tests.

```yaml
status: draft   # draft | ready | executed
source_grill: docs/prd/grill-signoff.md
updated: YYYY-MM-DD
```

## How to write cases

1. One case = one user-visible journey (happy path or must-not-fail path).
2. Trace each case to a module PRD acceptance criterion.
3. Steps and expected results must be observable without reading internals.
4. Prefer few deep journeys over many overlapping clicks.
5. Do **not** implement product code here — cases only.

## Case catalog

| ID | Module | Journey | Priority | Source AC | Automation |
| -- | ------ | ------- | -------- | --------- | ---------- |
| E2E-01 | M01-… | … | P0 | `docs/prd/modules/M01-….md` #… | pending |
| E2E-02 | M01-… | … | P0 | … | pending |

### E2E-01 — <short title>

- **Module:** M01-…
- **Actor:** …
- **Preconditions:** …
- **Steps:**
  1. …
  2. …
- **Expected:** …
- **Out of scope for this case:** …
- **Source:** module AC / macro journey …

### E2E-02 — <short title>

- **Module:** …
- **Actor:** …
- **Preconditions:** …
- **Steps:**
  1. …
- **Expected:** …
- **Source:** …

## Coverage check

- [ ] Every P0 module acceptance criterion maps to ≥1 E2E case **or** an explicit deferral below
- [ ] Critical journeys from macro PRD covered
- [ ] Must-not-fail / error paths covered where PRD requires them
- [ ] No case depends on fragile internal file paths

## Deferred (accepted)

| AC / journey | Why deferred | Follow-up |
| ------------ | ------------ | --------- |
| … | … | … |

## Execution log (filled by `/prd-build-loop`)

| ID | Result | Command / suite | Notes | Date |
| -- | ------ | --------------- | ----- | ---- |
| E2E-01 | pass / fail / blocked | … | … | YYYY-MM-DD |
