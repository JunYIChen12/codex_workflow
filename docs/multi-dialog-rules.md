# Multi-Dialog Rules

## Strict Mode

Strict multi-dialog mode uses actual separate Codex conversations for required roles:

```text
Human -> Controller -> Architect -> Controller -> Developer -> Controller -> Acceptance Tester -> Controller
```

One thread sequentially impersonating all roles is not valid strict-mode evidence.

## State Ownership

Controller-owned canonical files:

- `workflow-state.md`
- `session-registry.md`
- `agent-registry.md`
- `milestone-plan.md`
- `shared-task.md`

Worker-owned files:

- `architect-output.md`
- `developer-output.md`
- `acceptance-output.md`
- `handoffs/<task-id>.md`

Workers must not rewrite canonical state unless the task grants an exact allowed path and section.

## Trigger Gates

1. Controller creates or updates workflow state and registries.
2. Architect starts only after Controller setup exists.
3. Developer starts only after Architect output is accepted or a bypass is explicitly recorded.
4. Acceptance Tester starts only after Developer output and implementation evidence exist.
5. Merge starts only after a fresh explicit human merge command after testing.

## Controller Patience

The Controller patience policy prevents premature closeout and protects worker independence.

| Event | Minimum interval or wait |
| --- | --- |
| First thread readback after launch | Immediate, thread id and startup only |
| Architect polling | At least 3 minutes apart |
| Developer polling | At least 5 minutes apart |
| Acceptance polling | At least 3 minutes apart |
| Architect closeout prompt | After 10 minutes without output and no fresh progress |
| Developer closeout prompt | After 15 minutes without output and no fresh progress |
| Acceptance closeout prompt | After 10 minutes without output and no fresh progress |

Before closeout, classify the worker as `progressing`, `closing`, `stalled`, or `invalid`. Do not pressure a progressing worker to summarize early.

## Process Failure Codes

- `process-failed-single-thread-impersonation`
- `process-failed-controller-product-write`
- `process-failed-missing-role-thread`
- `process-failed-self-acceptance`
- `blocked-session-orchestration-unavailable`
- `process-failed-premature-closeout`
- `process-failed-ai-merged-main-without-human-test`
