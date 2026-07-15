# prd-build-loop-skills

Cursor Agent Skills：**从想法或老代码到模块化 PRD，挑战定稿后，自动拆任务并循环实现直到完成**。

组合 [mattpocock/skills](https://github.com/mattpocock/skills)（setup、**grill-with-docs / grilling / domain-modeling / to-spec / research**、to-issues、tdd、handoff）与 [ralph-loop-skills](https://github.com/tradesdontlie/ralph-loop-skills) 方法论。

## 两条主路径

```text
绿场：想法 → /prd-author → /prd-grill → /prd-build-loop
棕地：代码 → /prd-reverse（As-Is）→ 表征基线 → To-Be/迁移计划 → /prd-build-loop
```

## 安装

### 方式 1：npx skills（推荐）

```bash
npx skills@latest add ballmaK/prd-build-loop-skills --agent cursor -y -g
```

### 方式 2：手动复制

```bash
# 编排 skill → 目标项目
cp -r skills/prd-author skills/prd-grill skills/prd-reverse skills/prd-build-loop \
  /path/to/project/.cursor/skills/

# Ralph 辅助 skill → 全局
cp -r skills/ralph-* ~/.agents/skills/
```

### 依赖 skill（需另行安装）

```bash
npx skills@latest add mattpocock/skills \
  --skill setup-matt-pocock-skills --skill grill-with-docs --skill grilling \
  --skill domain-modeling --skill to-spec --skill to-issues --skill tdd \
  --skill handoff --skill grill-me --skill research \
  --skill improve-codebase-architecture \
  --agent cursor -y -g
```

## 使用

### A. 绿场：还没有 PRD（从想法开始）

```
/prd-author
```

产出：`docs/prd/00-macro-shared.md` + `docs/prd/modules/*.md` + draft `grill-signoff.md`，并维护 `CONTEXT.md` / ADR。

### B. 棕地：老项目逆向

```
/prd-reverse
```

产出：`docs/prd/as-is/`（system map、modules、known-debt、unknowns、reverse-signoff）。

通过 fidelity 签核后：先做表征测试基线，再写 To-Be / 迁移计划；**不要把 As-Is 单独喂给** `/prd-build-loop`。

### C. 已有模块化 To-Be PRD → 成品挑战

```
/prd-grill
```

通过后写入 `docs/prd/grill-signoff.md`（`status: approved`）。

### D. 挑战通过 → 自动实现

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
| `prd-reverse` | **棕地逆向**：代码 → 模块化 As-Is PRD + 忠实度签核 |
| `prd-grill` | **PRD 挑战门**：对已有 To-Be PRD 再拷问，产出 sign-off |
| `prd-build-loop` | **主编排**：过门后 PRD → active-plan → 循环实现 |
| `ralph-init` | 初始化 specs/、prompts/、ralph.sh |
| `ralph-implement` | 单次执行一个 checkbox 任务 |
| `ralph-loop` | 外层循环控制与续跑指引 |

> 绞杀式 `prd-migrate` 为后续能力。培训材料见 `docs/training/` 与 `docs/briefings/`。

## 许可证

MIT
