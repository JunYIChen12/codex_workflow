# Quick Start

Use this package when a task needs durable state, separate role conversations, or a human-gated publication path.

## 1. Create A Workflow Directory

Create a directory in the target repository or project control plane:

```text
docs/workflows/<workflow_slug>/
```

Copy these templates into it:

- `templates/workflow-state.template.md` as `workflow-state.md`
- `templates/agent-registry.template.md` as `agent-registry.md`
- `templates/session-registry.template.md` as `session-registry.md`
- `templates/shared-task.template.md` as `shared-task.md`

## 2. Fill The Controller State

The Controller records:

- objective, scope, and acceptance criteria
- allowed writes and forbidden actions
- GitHub repository, branch, PR, and check context
- role trigger gates
- waiting policy for worker threads
- publication status and human merge authorization

## 3. Launch Roles Serially

Launch only the next eligible role:

1. Architect after Controller setup exists.
2. Developer after Architect output is accepted or explicitly bypassed.
3. Acceptance Tester after Developer output and publication evidence exist.

Each role must write exactly one canonical output file listed in `agent-registry.md`.

## 4. Verify Before Publishing

Run local validation:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-docs.ps1
```

For GitHub work, push a feature branch and open a pull request only when authorized. Leave AI-authored PRs open for human testing unless the human gives a fresh explicit merge command.

## 5. Close The Workflow

Close only after:

- required role outputs exist
- verification evidence is recorded
- no role crossed its allowed writes
- the PR is either open for human testing or explicitly approved for merge by the human
- noise and remaining risks are documented

