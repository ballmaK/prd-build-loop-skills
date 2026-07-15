# 教练手册 · PulseNotes Lab

## 开场话术（2 分钟）

> 今天不做大系统。我们用 PulseNotes 这条小路径，把 PPT 里的纪律跑通：  
> **先对齐，再过门，再小步实现。工具可以换，产物路径不能糊。**

把培训 HTML PPT 放到旁路屏：`docs/briefings/training-html-ppt/index.html`。

---

## 时间盒（90 分钟标准场）

| 分钟 | 环节 | 你做什么 |
| ---- | ---- | -------- |
| 0–25 | PPT 精讲 | 痛点 → Matt 四翻车 → 组合关系 → 双路径 → 三铁律 |
| 25–35 | Setup | 巡场：agent 名、skills 列表、git init |
| 35–55 | A1 author | **强制一次一问**；拦截“直接写满 PRD” |
| 55–65 | A2 grill | 未 approved 禁止进实现 |
| 65–80 | A3 build | 只许 1 个任务；检查是否真 TDD |
| 80–90 | 复盘 / 可选 B | 抽 2 人展示产物路径；点名翻车 |

**60 分钟精简场：** 砍 Station B；A3 可停在“计划已生成 + 口头说清第 1 刀”。

---

## 示范反例（PPT 共鸣页可当场演）

让 Agent 自由发挥（不要用技能）：

```text
根据 scenario.md 把 PulseNotes 全做完，包括登录和周报。
```

预期翻车：范围膨胀、无签核、无竖切。  
再用正确触发语对照，学员立刻懂“为什么需要 Skills”。

---

## 巡场纠偏口令

- 「一次只留一个问题。」  
- 「决策等学员回答，事实请自己查仓库。」  
- 「产物路径发到群里。」  
- 「没有 approved，不许 build。」  
- 「As-Is 不是 backlog。」  
- 「满 3–5 个任务就 handoff。」

---

## 与 PPT 页的映射（方便你点回去）

1. 共鸣 → Lab 反例演示  
2. Matt 四翻车 → Setup 后口头提问：今天会碰到哪一类？  
3. 组合关系 → 指向 author/grill 实际调用 grilling/tdd  
4. 工具页 → `--agent` 巡检  
5. 地图/选型 → Station A/B  
6. 跟练页 → 学员复制触发语  
7. 铁律/翻车 → checklist 当面勾  
8. 作业 → PARTICIPANT 回家题  

---

## 评分建议（过关制，不打分卷）

通过 = `checklist.md` 绿场主线全部勾完。  
优秀 = 另加 Station B 或完成第 2 个竖切 + handoff。

---

## 物料清单

- [ ] 培训 PPT 可投影  
- [ ] 本 lab 目录可访问（repo 或压缩包）  
- [ ] 样例 `samples/` 仅教练持有或最后解锁  
- [ ] 备用：无公网时的离线 skills 拷贝方案（提前拷 `~/.agents/skills`）

---

## 结束金句

> 先把流程跑通，再追求更快。今晚回家只加一刀也算赢。
