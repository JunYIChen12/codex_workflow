# ADR-003: Use Serial Codex App Session Orchestration

## Status

Accepted

## Date

2026-06-14

## Context

Multi-dialog Codex work can fail when roles are launched before shared state exists, when workers rewrite Controller files, or when output names do not match the registry.

## Decision

Use serial trigger gates by default:

1. Controller initializes state.
2. Architect writes `architect-output.md`.
3. Controller verifies Architect output.
4. Developer writes `developer-output.md` or a handoff.
5. Controller verifies Developer output.
6. Acceptance Tester writes `acceptance-output.md`.
7. Controller reconciles and closes or publishes.

Parallelism is allowed only when write surfaces, inputs, and join conditions are independent.

## Consequences

- Startup is slower but recovery is clearer.
- Role prompts are more explicit.
- Workers have narrower write surfaces.

