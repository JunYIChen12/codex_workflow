# ADR-005: Human-Gated Main Merge And Controller Patience

## Status

Accepted

## Date

2026-06-14

## Context

Strict multi-dialog workflows can still lose trust if the Controller pressures workers to close out early or merges AI-authored work before human testing.

## Decision

Use a Controller patience policy:

- immediate readback only confirms thread creation and startup state
- Architect and Acceptance polling at least 3 minutes apart
- Developer polling at least 5 minutes apart
- closeout prompts only after the relevant patience window and no fresh progress

Use a human-gated publication path:

- AI may create a branch and PR when authorized
- AI may wait for CI and summarize evidence
- AI must leave PRs open for human testing
- AI may merge only after fresh explicit human merge authorization after testing

## Consequences

- Completion can mean `open-awaiting-human-test`.
- Human product judgment remains separate from AI acceptance and CI.
- Workflow outputs must record noise from premature polling or boundary drift.

