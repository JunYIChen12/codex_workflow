# Codex Workflow Framework

Reusable operating rules, templates, and validation checks for strict Codex multi-dialog workflows.

This repository packages a file-based control plane for work that needs more than one Codex conversation: a Controller coordinates state, an Architect designs the approach, a Developer implements the approved slice, and an Acceptance Tester verifies independently before publication.

## Quick Start

1. Copy the templates into a workflow directory in your project, such as `docs/workflows/<workflow_slug>/`.
2. Fill in `workflow-state.md`, `agent-registry.md`, `session-registry.md`, and `shared-task.md`.
3. Launch only the next role whose trigger gate is satisfied.
4. Require each role to write its canonical output file.
5. Publish AI-authored work through a branch and pull request, then leave the PR open for human testing.

See [docs/quick-start.md](docs/quick-start.md) for the full path.

## What Is Included

- Strict multi-dialog operating rules.
- Controller patience and human-gated merge policy.
- Workflow state, registry, task, prompt, handoff, issue, and PR templates.
- Sanitized examples for empty repository bootstrap and workflow recovery.
- A lightweight PowerShell validator and GitHub Actions workflow.

## Commands

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-docs.ps1
```

## Publication Boundary

- AI may create branches and pull requests only when authorized.
- AI-authored package work remains open for human testing.
- AI must not merge to `main` unless the human gives a fresh, explicit merge command after testing.

