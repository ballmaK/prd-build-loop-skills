# prd-build-loop-skills

Cursor Agent Skills：**从想法生成模块化 PRD，挑战定稿后，自动拆任务并循环实现直到完成**。

组合 [mattpocock/skills](https://github.com/mattpocock/skills)（setup、**grill-with-docs / grilling / domain-modeling / to-spec**、to-issues、tdd、handoff）与 [ralph-loop-skills](https://github.com/tradesdontlie/ralph-loop-skills) 方法论。

完整链路：

```
/prd-author  →  /prd-grill  →  /prd-build-loop
 (生成 PRD)     (成品挑战)      (拆任务+实现)
```

## 安装

### 方式 1：npx skills（推荐）

```bash
npx skills@latest add ballmaK/prd-build-loop-skills --agent cursor -y -g
```

### 方式 2：手动复制

```bash
# 编排 skill → 目标项目
cp -r skills/prd-author skills/prd-grill skills/prd-build-loop /path/to/project/.cursor/skills/

# Ralph 辅助 skill → 全局
cp -r skills/ralph-* ~/.agents/skills/
```

### 依赖 skill（需另行安装）

```bash
npx skills@latest add mattpocock/skills \
  --skill setup-matt-pocock-skills --skill grill-with-docs --skill grilling \
  --skill domain-modeling --skill to-spec --skill to-issues --skill tdd \
  --skill handoff --skill grill-me \
  --agent cursor -y -g
```

## 使用

### A. 还没有 PRD（从想法开始）

```
/prd-author
```

产出：`docs/prd/00-macro-shared.md` + `docs/prd/modules/*.md` + draft `grill-signoff.md`，并维护 `CONTEXT.md` / ADR。

### B. 已有模块化 PRD → 成品挑战

```
/prd-grill
```

通过后写入 `docs/prd/grill-signoff.md`（`status: approved`）。

### C. 挑战通过 → 自动实现

将 `templates/` 中的 Ralph 脚手架复制到项目根目录（或让 skill 自动生成），然后：

```
/prd-build-loop
```

续跑：

```
/prd-build-loop continue
```

## 本仓库技能清单

| Skill | 说明 |
| ----- | ---- |
| `prd-author` | **PRD 生成**：grill-with-docs → 合成模块化 `docs/prd/` |
| `prd-grill` | **PRD 挑战门**：对已有 PRD 再拷问，产出 sign-off |
| `prd-build-loop` | **主编排**：grill 通过后 PRD → active-plan → 循环实现 |
| `ralph-init` | 初始化 specs/、prompts/、ralph.sh |
| `ralph-implement` | 单次执行一个 checkbox 任务 |
| `ralph-loop` | 外层循环控制与 Cursor 续跑指引 |

## 许可证

MIT
