# 学员手册 · PulseNotes Lab

适用：Cursor / OpenCode / Claude Code / 其他支持 Agent Skills 的工具。  
原则：**看产物路径，不绑定某个 IDE 按钮。**

---

## 0. 开始前（10 分钟）

### 0.1 建一个空练习目录

```bash
mkdir -p ~/labs/pulse-notes && cd ~/labs/pulse-notes
git init
```

把本 lab 的 `starter/` 内容拷进来（或直接在空目录开始也行）：

```bash
# 若你已克隆 prd-build-loop-skills 仓库
cp -R <repo>/docs/training/pulse-notes-lab/starter/. ~/labs/pulse-notes/
```

### 0.2 安装技能（按你的工具改 agent）

```bash
# 地基：Matt
npx skills@latest add mattpocock/skills --agent <你的工具> -y -g

# 交付编排：本仓库（完整链路建议用功能分支）
npx skills@latest add https://github.com/ballmaK/prd-build-loop-skills/tree/cursor/prd-grill-gate-3278 \
  --agent <你的工具> -y -g

# 棕地能力（可选）
npx skills@latest add https://github.com/ballmaK/prd-build-loop-skills/tree/cursor/prd-reverse-as-is-3278 \
  --agent <你的工具> -y -g
```

`<你的工具>` 示例：`cursor` / `opencode` / `claude-code` …

然后在练习项目里触发一次：

```text
按 setup-matt-pocock-skills 配置本仓库：issue tracker 用本地 markdown。
```

### 0.3 打开场景原料

阅读：`docs/training/pulse-notes-lab/scenario.md`（或教练发给你的副本）。  
记住：它**故意不完整**。

---

## Station A · 绿场（主线，约 45–55 分钟）

对应 PPT：地图、绿场跟练、三铁律。

### A1. 生成模块化 PRD（author）

触发语（可复制）：

```text
按 prd-author 执行。
场景原料如下（或见 scenario.md）。
请用 grill-with-docs / grilling 纪律：一次只问一个问题，并给出推荐答案。
最终产出模块化 docs/prd/，不要写实现代码，不要把 grill-signoff 标成 approved。
```

你应看到：

- Agent **一次一问**（连问五个就是翻车）
- 问完并经你确认后，出现：
  - `docs/prd/00-macro-shared.md`
  - `docs/prd/modules/M*.md`
  - `docs/prd/README.md`（含开发顺序）
  - `CONTEXT.md`（领域词）
  - `docs/prd/grill-signoff.md` 为 **draft**（或尚未 approved）

**检查点：** 你能否用自己的话讲清：目标、非目标、模块边界、第 1 个竖切是什么？

### A2. 成品挑战（grill）

```text
按 prd-grill 挑战当前 docs/prd/。
一次一问。通过后把 docs/prd/grill-signoff.md 写成 status: approved。
不要开始实现。
```

你应看到：

- 对验收标准 / 边界 / 顺序做压力测试
- `grill-signoff.md` → `status: approved`

**检查点：** 没有 approved，就不得进入 A3。

### A3. 循环实现一个任务（build-loop）

```text
按 prd-build-loop 开始。
本会话最多做 1 个 checkbox 任务。
必须用 tdd：先红后绿。
完成后标记 active-plan，提交，然后停下复盘。
```

你应看到：

- `specs/implementation-plans/active-plan.md` 生成/更新
- 只推进 **一个** `- [ ]` → `- [x]`
- 有测试、有小步 commit（信息可类似 `ralph: …`）

**检查点：** 演示一个可运行的最小行为（例如：能新增一条 pulse 并在列表看到）。

### A4. 会话纪律（体验即可）

如果还想继续：

```text
按 handoff 生成本会话移交摘要，方便下个会话 continue。
```

或新会话：

```text
按 prd-build-loop continue，仍然一次只做一个任务。
```

---

## Station B · 棕地（可选，约 20 分钟）

对应 PPT：棕地入口、As-Is ≠ backlog。

1. 另开目录，拷入 lab 的 `legacy/`：

```bash
mkdir -p ~/labs/pulse-notes-legacy && cp -R <repo>/docs/training/pulse-notes-lab/legacy/. ~/labs/pulse-notes-legacy/
cd ~/labs/pulse-notes-legacy
```

2. 触发：

```text
按 prd-reverse 从当前代码生成 As-Is PRD。
猜的请标 hypothesis。不要实现改造。
完成后做 fidelity 确认，再决定是否 approved reverse-signoff。
```

你应看到：`docs/prd/as-is/`（system-map、modules、known-debt、unknowns、reverse-signoff）

**检查点：** 你有没有把 As-Is 直接丢给 build-loop？若有，立刻停下（这是故意设置的翻车点）。

正确下一步口述即可：**表征测试 → To-Be/差距矩阵 → 再实现**。

---

## 完成后交什么（给教练看）

最少提交 / 展示这些路径：

1. `docs/prd/`（绿场）或 `docs/prd/as-is/`（棕地）  
2. 对应 `*-signoff.md`（状态说得清）  
3. 绿场：`active-plan.md` + 1 个竖切的测试/代码  
4. 一句话复盘：今天哪条铁律救了你，或你刚翻了哪个车

---

## 常见翻车（自查）

| 现象 | 修法 |
| ---- | ---- |
| Agent 一次问五件事 | 打断：要求一次一问 |
| 没签核就写代码 | 退回 grill / reverse |
| As-Is 当任务列表 | 停 build，先做 To-Be |
| 一会话做完五个功能 | handoff，下次再 continue |
| 只聊天不落盘 | 追问产物路径 |

---

## 回家作业（选一题）

1. 把第 2 个 checkbox 在新会话做完  
2. 给 PulseNotes 补「删除」或「筛选」的 PRD 模块，再 grill 一次  
3. 对 legacy 写一页 keep/change/kill/rewrite 差距表（不必写码）
