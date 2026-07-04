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
6. Create `.ralph-security` sign-off
7. Update `.gitignore` for `.ralph-logs/`, `.ralph-stop`, `.scratch/`

Upstream reference: https://github.com/tradesdontlie/ralph-loop-skills
