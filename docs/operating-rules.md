# Operating Rules

## Purpose

The control plane coordinates Codex work without replacing the target repository, its tests, or its GitHub review process. It stores recovery state, role prompts, handoffs, evidence, and decisions.

## Controller Responsibilities

- Maintain workflow state, registries, prompts, task cards, handoffs, dashboards, and decision records.
- Identify the GitHub repository, issue, branch, pull request, and Actions context for company or shared work.
- Delegate implementation to bounded worker roles.
- Record evidence from files, commands, commits, PRs, checks, screenshots, or handoffs.
- Stop at authorization boundaries such as push, PR creation, merge, deployment, production mutation, and credential changes.

## Worker Responsibilities

- Confirm actual current directory, repository root, branch, and git status before edits.
- Read the assigned task and project rules.
- Stay inside allowed writes.
- Preserve existing behavior unless explicitly assigned to change it.
- Run the required verification for the assigned slice.
- Write a compact output or handoff with proof, risks, and noise notes.

## GitHub-First Collaboration

Use GitHub as the review and publication surface when a repository is available:

| Object | Purpose |
| --- | --- |
| Issue or milestone | Product goal, scope, and acceptance criteria |
| Branch | Isolated implementation slice |
| Pull request | Review, evidence, and human testing surface |
| Actions | Automated quality gates |
| Review comments | Follow-up work and requested changes |

The local workflow files index GitHub objects; they do not replace them.

## Evidence Rules

Valid evidence includes:

- command and decisive result
- file path and relevant line
- commit hash
- pull request URL
- GitHub Actions check result
- screenshot or runtime readback
- role handoff
- human acceptance statement

Invalid evidence includes generic claims that work appears complete without files, commands, or GitHub proof.

## Scope Discipline

Do not:

- rewrite completed features unless explicitly requested
- add duplicate components, APIs, utilities, templates, or workflow files
- leave dead files or temporary debug material
- modify Controller-owned state from a worker unless an exact section is granted
- merge AI-authored work into `main` without fresh explicit human approval after testing

