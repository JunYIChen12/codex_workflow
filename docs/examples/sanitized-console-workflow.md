# Sanitized Console Workflow Case Study

## What Happened

A local control-plane workflow evolved through several runs. Early attempts proved that useful engineering work can still fail to validate a strict multi-dialog process when roles are collapsed, launched too early, or allowed to rewrite shared state.

## Lessons

- Launching all roles at once creates stale snapshots and blocked outputs.
- Controller-owned state needs one owner.
- Role output filenames must match the registry.
- Acceptance must be independent from implementation.
- A passing PR is not the same as human-tested merge approval.
- Polling workers too aggressively can reduce output quality and create noisy coordination.

## Resulting Rules

- Use serial trigger gates.
- Require real role thread ids in strict mode.
- Keep Developer and Acceptance separate.
- Record Controller patience policy before launching workers.
- Leave AI-authored PRs open for human testing.

