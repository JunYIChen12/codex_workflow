# ADR-004: Require Real Role Threads For Workflow Validation

## Status

Accepted

## Date

2026-06-14

## Context

A single Codex thread can perform useful engineering work while still failing to prove that a multi-dialog workflow works. Strict workflow validation requires separate role conversations and independent acceptance.

## Decision

When the goal is to test, prove, or use the reusable multi-role workflow, strict multi-dialog mode is the default.

Strict mode requires:

- one Controller thread
- one separate Architect thread before implementation
- one separate Developer thread for implementation
- one separate Acceptance Tester or Reviewer thread before merge
- canonical role outputs written by the owning role thread

If separate role sessions are unavailable, mark the workflow blocked before implementation unless the human explicitly waives strict mode.

## Consequences

- Workflow validation may stop earlier when session orchestration is unavailable.
- Single-thread implementation remains useful for ordinary work, but not as strict-mode proof.
- Registries must record real thread ids and process failures.

