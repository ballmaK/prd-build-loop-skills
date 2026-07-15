# PulseNotes Lab · 现场实操培训包

> 配套材料：`docs/briefings/training-html-ppt/`（培训 HTML PPT）  
> 目标：用一个**简单但完整**的小项目，把 PPT 里的概念在现场跑一遍。

## 这个 lab 覆盖什么

| PPT 主题 | Lab 对应环节 |
| -------- | ------------ |
| 快但不可控 | 反例演示 + 共识 |
| Matt Skills 地基 | 安装 + setup + grilling/tdd |
| 工具无关 | `--agent` 自选，看产物不认 UI |
| 交付地图 | author → grill → build-loop |
| 绿场入口 | Station A：PulseNotes 新品 |
| 棕地入口 | Station B：`legacy/` 逆向（可选） |
| 三铁律 / 翻车点 | 检查清单 + 教练纠偏 |
| 回家作业 | Lab 末尾扩展题 |

## 怎么用

1. 教练先过培训 PPT（约 20–30 分钟）  
2. 打开本目录，跟 [`FACILITATOR.md`](./FACILITATOR.md) 带现场  
3. 学员打开 [`PARTICIPANT.md`](./PARTICIPANT.md) 实操  
4. 验收用 [`checklist.md`](./checklist.md)  
5. 卡住时可对照 [`samples/`](./samples/)（**先自己做，再看样例**）

## 建议时间

- **标准场：90 分钟**（含绿场 + 可选棕地）  
- **精简场：60 分钟**（只做绿场到第 1 个竖切任务）

## 场景一句话

做一个叫 **PulseNotes** 的个人「当日状态便签」小工具：能新建一条 pulse、列表查看、按心情标签筛选。功能故意很小，方便把流程跑全。

## 目录

```
pulse-notes-lab/
├── README.md
├── FACILITATOR.md      # 教练脚本
├── PARTICIPANT.md      # 学员手册
├── scenario.md         # 故意不完整的需求原料
├── checklist.md        # 过关清单
├── starter/            # 绿场空项目脚手架
├── legacy/             # 棕地逆向用的“脏代码”
└── samples/            # 参考产物（答疑用）
```
