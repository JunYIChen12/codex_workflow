# Workflow State

## Identity

workflow_slug:
workflow_label:
run_id:
created_at:
controller_thread:

## Codex App Context

intended_project_path:
codex_app_project_id:
project_registration_status: registered | missing | projectless-fallback
session_creation_mode: project-local | project-worktree | projectless
controller_thread_id:

## GitHub Context

repository:
default_branch:
milestone:
epic_issue:
active_issue:
active_branch:
active_pr:
pr_publication_status: none | branch-only | pr-open-awaiting-ci | open-awaiting-human-test | approved-by-human-to-merge | merged
human_merge_authorization:
- authorized: no | yes
- source:
- time:
required_checks:
actions_url:

## Orchestration Brief

goal:
deliverables:
in_scope:
out_of_scope:
acceptance_criteria:
constraints:
known_artifacts:
open_questions:
recommended_first_harness:

## Project Constraints Capsule

source_files:
- project `AGENTS.md`
- project README
- project workflow docs
- GitHub issue or PR when available

capability_mode:
package_manager:

verification_tiers:
- tier: docs-only
  use_when:
  commands:
  skip:
- tier: unit-or-component
  use_when:
  commands:
  skip:
- tier: integration-runtime
  use_when:
  commands:
  skip:

forbidden_commands:
- destructive git reset
- destructive delete without explicit authorization
- production mutation without explicit authorization
- unauthorized main merge

worker_prompt_must_include:
- Read this workflow state.
- Read the assigned task.
- Identify GitHub repository, issue, branch, PR, and Actions context when available.
- Stay inside allowed writes.
- Record proof.
- Write a compact handoff or canonical role output.

## Workflow Shape

controller_role:
worker_policy:
parallel_policy:
state_source_of_truth:
handoff_rule:
completion_rule:
rollover_rule:
github_policy:

## Execution Mode

workflow_execution_mode: strict-multi-dialog | single-thread-fallback
strict_mode_reason:
single_thread_fallback_allowed: no | yes
single_thread_fallback_reason:
role_thread_requirement:
- Architect: required | waived
- Developer: required | waived
- Acceptance Tester: required | waived
controller_product_write_policy: forbidden | explicitly-assigned
workflow_validity: pending | valid | process-failed | blocked
process_failure_codes:
- none

## Controller Scheduling Policy

worker_waiting_policy:
- first_readback_after_launch: immediate thread id confirmation only
- architect_poll_interval: >= 3 minutes
- developer_poll_interval: >= 5 minutes
- acceptance_poll_interval: >= 3 minutes
- architect_closeout_not_before: 10 minutes without output and no fresh progress
- developer_closeout_not_before: 15 minutes without output and no fresh progress
- acceptance_closeout_not_before: 10 minutes without output and no fresh progress

worker_status_classification:
- progressing: reading/analyzing/implementing/verifying/writing output
- closing: explicitly producing final output
- stalled: no useful progress beyond the patience window
- invalid: scope violation or unrecoverable setup failure

closeout_policy:
- Do not request closeout from a progressing worker.
- Send at most one closeout prompt before classifying replacement or blocker.
- Record any early closeout as noise or process failure.

## State Ownership

controller_owned_files:
- workflow-state.md
- session-registry.md
- agent-registry.md
- milestone-plan.md
- shared-task.md

worker_owned_files:
- architect-output.md
- developer-output.md
- acceptance-output.md
- handoffs/<task-id>.md

state_write_policy:
- Controller is the only default writer for canonical state files.
- Workers may not rewrite canonical state unless the task grants an exact allowed path and section.
- Blocked workers write their own output or handoff, then stop.

## Role Trigger Gates

| Role | Canonical Output | Trigger Condition | Status | Thread | Actual Thread ID | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Controller | workflow-state.md | user request received | active |  |  |  |
| Architect | architect-output.md | Controller setup complete | waiting |  |  |  |
| Developer | developer-output.md | Architect output accepted or explicitly bypassed | waiting |  |  |  |
| Acceptance Tester | acceptance-output.md | Developer output exists and evidence is ready | waiting |  |  |  |

## Launch Events

| Time | Role | Thread | Actual Thread ID | Event | Result | Controller Action |
| --- | --- | --- | --- | --- | --- | --- |
|  |  |  |  | launched |  |  |

## Program Backlog

current:
completed:
pending:
blocked:
next:

## Evidence Notes

- command:
  result:
  evidence:

## Workflow Validation

- real_controller_thread:
- real_architect_thread:
- real_developer_thread:
- real_acceptance_thread:
- controller_wrote_product_files: yes | no
- controller_wrote_worker_outputs: yes | no
- implementation_thread_self_accepted: yes | no
- premature_closeout_events:
- ai_merged_without_human_test: yes | no
- strict_mode_result: valid | process-failed | blocked

