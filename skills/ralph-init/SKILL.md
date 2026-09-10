---
name: ralph-init
description: Bootstrap Ralph loop structure in a project — specs/, prompts/, ralph.sh, test-wrapper.sh, security sign-off. Use when setting up autonomous implementation loops.
disable-model-invocation: true
---

# Ralph Init Skill

Bootstrap the Ralph loop structure in the **target project**.

## Execution Steps

1. Security pre-flight — environment, credentials, blast radius
2. Create `specs/{features,implementation-plans,conventions}/`, `prompts/`, `scripts/`
3. Detect codebase and test command
4. Create `specs/README.md` (Pin), `specs/current-state.md`
5. Copy `templates/prompts/implement.md`, `templates/test-wrapper.sh`, `templates/scripts/ralph.sh`
6. If `docs/prd/` is missing entirely, copy modular PRD skeletons from `templates/docs/prd/` (`README.md`, `00-macro-shared.md`, `modules/M01-example.md`, `grill-signoff.md` + `e2e-cases.md` as **draft**) and tell the user to run **`/prd-author`**
7. If `docs/prd/` exists and `docs/prd/grill-signoff.md` is missing, copy `templates/docs/prd/grill-signoff.md` as a **draft** placeholder (do not set `approved`)
7b. If `docs/prd/` exists and `docs/prd/e2e-cases.md` is missing, copy `templates/docs/prd/e2e-cases.md` as a **draft** placeholder (do not set `ready`; prefer filling via `/prd-grill`)
8. If brownfield and `docs/prd/as-is/` is missing, copy `templates/docs/prd/as-is/` skeletons as draft placeholders and suggest **`/prd-reverse`**
9. Create `.ralph-security` sign-off
10. Update `.gitignore` for `.ralph-logs/`, `.ralph-stop`, `.scratch/`

Upstream reference: https://github.com/tradesdontlie/ralph-loop-skills
