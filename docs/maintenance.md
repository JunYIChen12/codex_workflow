# Maintenance

## Updating Templates

When a workflow rule changes, update every affected template in one reviewable change:

- `workflow-state.template.md`
- `agent-registry.template.md`
- `session-registry.template.md`
- `shared-task.template.md`
- `worker-prompt.template.md`
- `handoff.template.md`
- GitHub issue and PR templates

Run validation after template changes.

## Updating ADRs

Do not delete old ADRs. If a decision changes, add a new ADR that supersedes the earlier one and update the README or operating rules to point at the current decision.

## Adding Examples

Examples must be sanitized:

- no private project names
- no machine-specific user paths
- no raw worker transcripts
- no high-frequency controller history
- no credentials or cache content

Prefer short case studies that explain the lesson and link to the reusable rule or template.

## Validation Checks

The validation script is intentionally dependency-light. Extend it when a rule can be checked reliably without creating false confidence. Keep any check message clear enough for a future Developer thread to fix quickly.

