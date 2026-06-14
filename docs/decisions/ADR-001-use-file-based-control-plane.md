# ADR-001: Use A File-Based Control Plane

## Status

Accepted

## Date

2026-06-14

## Context

Codex workflows need durable state that survives chat compaction, thread changes, and multi-role handoffs. A single conversation is not a reliable archive for scope, evidence, risks, or publication boundaries.

## Decision

Use a file-based control plane for workflow state, registries, task prompts, handoffs, dashboards, and decisions.

Target product implementation remains in its own repository. The control plane coordinates and records evidence but does not replace project tests, source control, or GitHub review.

## Alternatives Considered

### Chat Memory Only

Fast to start, but not recoverable or auditable.

### One Product Repository Only

Useful for project-specific work, but weak for cross-project planning and reusable workflow rules.

### Reusable Package Only

Good for templates, but live workflow state would make the package noisy and less portable.

## Consequences

- Workflows can be resumed from files.
- Role boundaries and evidence can be audited.
- Live workflow state must be kept separate from public package content.

