# Macro / Shared PRD（样例节选）

## Problem Statement

个人需要一个低摩擦的方式记录“此刻状态”，以便回顾自己的节奏，而不是写长日记。

## Solution Summary

PulseNotes：本地优先的 pulse 条目工具。每条包含文本、时间戳、可选心情标签。

## Non-Goals

- 不做多人协作 / 社交 feed
- 不做周报自动汇总（可列为以后模块）
- 不做账号体系（首期单机）

## Shared Domain

见 `CONTEXT.md`：Pulse、MoodTag、PulseLog

## Module Map

| ID | Name | Responsibility |
| -- | ---- | -------------- |
| M01 | pulse-log | 创建与列表 pulse |
| M02 | mood-filter | 按标签筛选（可第二刀） |
