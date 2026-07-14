# prd-build-loop-skills

Cursor Agent Skills：**模块化 PRD → 拆任务 → 循环实现**；并支持 **老项目逆向生成 As-Is PRD**。

组合 [mattpocock/skills](https://github.com/mattpocock/skills)（setup、to-issues、tdd、handoff、research、domain-modeling、grilling）与 [ralph-loop-skills](https://github.com/tradesdontlie/ralph-loop-skills) 方法论。

## 两条主路径

```text
绿场：想法 →（prd-author，见功能分支）→ prd-grill → prd-build-loop
棕地：代码 → /prd-reverse（As-Is）→ 表征基线 → To-Be/迁移计划 → prd-build-loop
```

## 安装

### 方式 1：npx skills（推荐）

```bash
npx skills@latest add ballmaK/prd-build-loop-skills --agent cursor -y -g
```

若要装本棕地分支的完整内容：

```bash
npx skills@latest add https://github.com/ballmaK/prd-build-loop-skills/tree/cursor/prd-reverse-as-is-3278 \
  --agent cursor -y -g
```

### 方式 2：手动复制

```bash
# 编排 skill → 目标项目
cp -r skills/prd-reverse skills/prd-build-loop /path/to/project/.cursor/skills/

# Ralph 辅助 skill → 全局
cp -r skills/ralph-* ~/.agents/skills/
```

### 依赖 skill（需另行安装）

```bash
npx skills@latest add mattpocock/skills \
  --skill setup-matt-pocock-skills --skill to-issues --skill tdd \
  --skill domain-modeling --skill handoff --skill grilling \
  --skill research --skill improve-codebase-architecture \
  --agent cursor -y -g
```

## 使用

### 棕地：老项目逆向

```
/prd-reverse
```

产出：`docs/prd/as-is/`（system map、modules、known-debt、unknowns、reverse-signoff）。

通过 fidelity 签核后：先做表征测试基线，再写 To-Be / 迁移计划；**不要把 As-Is 单独喂给** `/prd-build-loop`。

### 绿场 / 已有 To-Be PRD

1. 定稿模块化 PRD：`docs/prd/00-macro-shared.md` + `docs/prd/modules/*.md`
2. 复制 `templates/` Ralph 脚手架（或 skill 自动生成）
3. 运行：

```
/prd-build-loop
```

续跑：`/prd-build-loop continue`

## 本仓库技能清单

| Skill | 说明 |
| ----- | ---- |
| `prd-reverse` | **棕地逆向**：代码 → 模块化 As-Is PRD + 忠实度签核 |
| `prd-build-loop` | **主编排**：To-Be / 迁移任务 → active-plan → 循环实现 |
| `ralph-init` | 初始化 specs/、prompts/、ralph.sh |
| `ralph-implement` | 单次执行一个 checkbox 任务 |
| `ralph-loop` | 外层循环控制与 Cursor 续跑指引 |

> 绿场 `prd-author` / `prd-grill` 见分支 `cursor/prd-grill-gate-3278`。绞杀式 `prd-migrate` 为后续能力。

## 许可证

MIT
