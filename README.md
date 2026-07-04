# prd-build-loop-skills

Cursor Agent Skills：**定稿模块化 PRD 后，自动拆任务并循环实现直到完成**。

组合 [mattpocock/skills](https://github.com/mattpocock/skills)（setup、to-issues、tdd、handoff）与 [ralph-loop-skills](https://github.com/tradesdontlie/ralph-loop-skills) 方法论。

## 安装

### 方式 1：npx skills（推荐）

```bash
npx skills@latest add srd13367430983/prd-build-loop-skills --agent cursor -y -g
```

### 方式 2：手动复制

```bash
# 编排 skill → 目标项目
cp -r skills/prd-build-loop /path/to/project/.cursor/skills/

# Ralph 辅助 skill → 全局
cp -r skills/ralph-* ~/.agents/skills/
```

### 依赖 skill（需另行安装）

```bash
npx skills@latest add mattpocock/skills \
  --skill setup-matt-pocock-skills --skill to-issues --skill tdd \
  --skill domain-modeling --skill handoff --skill grilling \
  --agent cursor -y -g
```

## 使用

1. 在目标项目准备好定稿 PRD：`docs/prd/00-macro-shared.md` + `docs/prd/modules/*.md`
2. 将 `templates/` 中的 Ralph 脚手架复制到项目根目录（或让 skill 自动生成）
3. 在 Cursor Agent 运行：

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
| `prd-build-loop` | **主编排**：PRD → active-plan → 循环实现 |
| `ralph-init` | 初始化 specs/、prompts/、ralph.sh |
| `ralph-implement` | 单次执行一个 checkbox 任务 |
| `ralph-loop` | 外层循环控制与 Cursor 续跑指引 |

## 许可证

MIT
