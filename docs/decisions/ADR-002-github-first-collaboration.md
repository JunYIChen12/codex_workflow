# ADR-002: Use GitHub-First Collaboration

## Status

Accepted

## Date

2026-06-14

## Context

For shared repositories, the durable collaboration surface is GitHub: Issues define work, branches isolate implementation, pull requests carry review and evidence, and Actions provide automated gates.

## Decision

Use GitHub as the publication and review surface whenever a repository is available.

The workflow control plane records GitHub object mapping, but it does not replace Issues, PRs, or checks.

## Operating Rules

- Identify repository, issue, branch, PR, and check context before implementation when applicable.
- Do not push, open PRs, merge, close issues, change branch protection, or deploy without authorization.
- Record GitHub evidence in handoffs and PR descriptions.
- Treat failing required checks as blockers unless explicitly deferred by an authorized human.

## Consequences

- Local handoffs and GitHub PRs stay aligned.
- CI failures feed directly back into implementation.
- Publication boundaries are visible to reviewers.

