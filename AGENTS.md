# AGENTS.md

## Project Goal

This repository packages a reusable Codex workflow framework. Changes must preserve strict role separation, human-gated publication, and sanitized public documentation.

## Non-Negotiable Rules

1. Do not publish raw local workflow run state, private paths, caches, secrets, or unrelated project files.
2. Before changing files, identify affected files, current behavior, unchanged requirements, and risks.
3. Keep changes scoped and incremental.
4. Reuse existing templates and docs instead of creating duplicates.
5. Do not leave temporary debug notes, stale markers, or dead files.
6. Run repository validation before committing package changes.
7. AI-authored pull requests must remain open for human testing unless the human explicitly commands a merge after testing.

## Strict Workflow Rules

- Controller, Architect, Developer, and Acceptance Tester are separate roles in strict multi-dialog workflows.
- Worker roles write only their assigned output files.
- Controller-owned workflow state must not be rewritten by workers.
- Acceptance must be independent from implementation.
- A missing role thread, self-acceptance, or unauthorized main merge is a process failure.

## Verification

Run:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-docs.ps1
```
