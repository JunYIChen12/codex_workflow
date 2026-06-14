# Empty Repository Bootstrap Example

## Scenario

A GitHub repository exists but has no commits, refs, or default branch. A normal feature branch PR cannot target a missing base branch.

## Safe Path

1. Record the empty-repo condition in `workflow-state.md`.
2. Ask for or confirm authorization for a one-time minimal bootstrap.
3. Create a tiny first commit on `main` containing repository identity and guardrails.
4. Push `main`.
5. Create a feature branch from `main`.
6. Put the real package work on the feature branch.
7. Open a PR and leave it open for human testing.

## Guardrail

The bootstrap authorization does not authorize merging the final PR.

