# Agent Registry

workflow_slug:
workflow_label:
run_id:

## Roles

| Role | Purpose | Canonical Output | Trigger | Allowed Writes | Forbidden |
| --- | --- | --- | --- | --- | --- |
| Controller | Schedule, reconcile, maintain state, enforce gates | workflow-state.md | user request | workflow-state.md, agent-registry.md, session-registry.md, shared-task.md, prompts/*.md | implementation files, worker outputs, unauthorized merge |
| Architect | Design approach and risks | architect-output.md | Controller setup complete | architect-output.md | implementation files, commits, pushes, PRs, Controller state |
| Developer | Implement approved package or product slice | developer-output.md | Architect output accepted | assigned files, developer-output.md | acceptance-output.md, Controller state, unauthorized merge |
| Acceptance Tester | Independently verify implementation and publication state | acceptance-output.md | Developer output and evidence ready | acceptance-output.md | implementation changes, self-acceptance, unauthorized merge |

## Canonical Output Rules

- Architect writes exactly `architect-output.md`.
- Developer writes exactly `developer-output.md`.
- Acceptance Tester writes exactly `acceptance-output.md`.
- Prompt drafts live under `prompts/` and are Controller-owned.
- Workers must not rewrite `workflow-state.md`, `session-registry.md`, `agent-registry.md`, or `shared-task.md`.

## Trigger Gates

1. Architect can start only after Controller control-plane files exist.
2. Developer can start only after Controller reads and accepts Architect output.
3. Acceptance Tester can start only after Developer output and publication evidence are available.
4. Merge can happen only after a fresh explicit human command after testing.

