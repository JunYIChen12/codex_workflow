# Publication Boundaries

## Default Boundary

AI-authored work should move through:

1. feature branch
2. pull request
3. automated checks
4. independent acceptance or review
5. human testing
6. explicit human merge command

Completion can mean `open-awaiting-human-test`. It does not have to mean merged.

## Human Merge Gate

The following are not merge authorization:

- continuing until complete
- CI passing
- AI acceptance passing
- a template phrase that says merge after acceptance

Valid merge authorization is recent, explicit, and names the pull request or branch to merge after human testing.

## Empty Repository Bootstrap

An empty remote with no default branch cannot receive a normal PR against `main`. Use one of these paths:

- Human creates a minimal first commit on `main`.
- AI creates one minimal bootstrap commit only when the human explicitly authorizes that exception.
- Full package work still happens on a feature branch and PR.

The bootstrap exception is not merge permission.

## Publication Status Vocabulary

- `none`
- `branch-only`
- `pr-open-awaiting-ci`
- `open-awaiting-human-test`
- `approved-by-human-to-merge`
- `merged`

