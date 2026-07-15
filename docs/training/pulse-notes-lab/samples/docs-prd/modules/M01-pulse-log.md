# M01 — pulse-log（样例节选）

## Purpose

管理单条 Pulse 的创建与按时间倒序列表。

## In Scope

- 新增一条 pulse（文本必填）
- 列出全部 pulse（新在前）

## Out of Scope

- 编辑 / 删除（后续）
- 云同步

## Acceptance Criteria

- [ ] 给定文本，创建后列表能立即看到该条
- [ ] 空文本被拒绝（明确错误）
- [ ] 列表按时间倒序

## Testing Notes

- 测外部行为：create → list
- 不测内部存储细节
