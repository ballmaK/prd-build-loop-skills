# 一期大纲 · Matt Skills 与 AI 落地心智模型

## 1. 我们要回答的问题

不是「哪个 AI 最好用」，而是：

1. Agent 为什么经常交不出靠谱结果？  
2. 有哪些可重复的纪律能稳住质量？  
3. 这些纪律如何拼成一条研发落地链路？

## 2. 核心主张

Matt Pocock Skills = **可组合的工程小技能**，给人留控制权。  
对立面：一把梭的「全自动流程框架」——出问题难调试、难改。

原则：**小、可改、可组合、模型无关。**

## 3. 四类翻车（理论主干）

### 3.1 做的不是我想要的（Misalignment）

- 原因：人自己也没想清；Agent 猜着做。  
- 解药：grilling —— 一次一问、推荐答案、决策归人、事实查仓库。  
- 入口：`grill-me` / `grill-with-docs`（工程场景优先后者）。

### 3.2 说话又长又飘（No shared language）

- 原因：没有项目黑话，Agent 每次用 20 个词解释 1 个概念。  
- 解药：`CONTEXT.md` + ADR + `domain-modeling`。  
- 收益：命名一致、好导航、省 token。

### 3.3 代码跑不通（Weak feedback）

- 原因：没有反馈环，Agent 盲飞。  
- 解药：类型 / 浏览器 / 测试；核心 skill = `tdd`（红绿重构）。  
- 辅药：`diagnosing-bugs`。

### 3.4 系统糊成泥球（Accelerated entropy）

- 原因：写得越快，结构烂得越快。  
- 解药：关心模块设计；`to-spec` 问清缝；`improve-codebase-architecture` 定期扫描。

## 4. 两类技能（组织方式）

| 类型 | 谁触发 | 角色 | 例子 |
| ---- | ------ | ---- | ---- |
| User-invoked | 你 | 编排入口 | grill-me, to-spec, implement |
| Model-invoked | 你或 Agent | 可复用纪律 | grilling, tdd, domain-modeling |

规则：用户技能可调模型技能；用户技能之间不互调。

## 5. 一条「开心路径」（落地简图）

```text
setup（每仓一次）
  → grill-with-docs（对齐 + 领域）
  → to-spec（合成规格，不再面试）
  → to-tickets（竖切工单）
  → implement + tdd（小步）
  → code-review（标准 × 规格）
  ↻ handoff（会话满了就移交）
```

重点纠偏：

- `to-spec` **不拷问**；拷问在更早完成。  
- 大需求用 `wayfinder` 先探路，再拆票。

## 6. 常用技能速览（分享够用即可）

**对齐与领域：** grill-me / grilling / grill-with-docs / domain-modeling  
**规格与拆工：** to-spec / to-tickets / triage / wayfinder  
**实现与质量：** tdd / implement / code-review / prototype / diagnosing-bugs / research  
**架构：** codebase-design / improve-codebase-architecture  
**协作：** handoff / ask-matt / setup-matt-pocock-skills

## 7. 和我们仓库的分工（预告后续）

```text
Matt            = 工程地基（怎么对齐、怎么测、怎么续跑）
prd-build-loop  = 交付操作系统（PRD 生成/逆向/签核/循环实现）
```

一期只要求大家认路；二期装技能；三期用 PulseNotes 把「绿场路径」跑通。

## 8. 带走三句话

1. **先对齐，再动手。**  
2. **反馈环是速度上限。**  
3. **小技能组合 > 大框架接管。**

## 参考

- https://github.com/mattpocock/skills  
- https://skills.sh/mattpocock/skills
