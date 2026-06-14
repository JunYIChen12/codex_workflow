## Summary

- 

## Scope

Changed:

- 

Intentionally not changed:

- 

## Verification

Local:

- [ ] `powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-docs.ps1`

GitHub Actions:

- [ ] validation checks pass

Human merge gate:

- [ ] PR left open for human testing
- [ ] Human explicitly authorized merge after testing
- Merge authorization source:

## Regression Checklist

- [ ] Existing related workflow guarantees still work.
- [ ] No duplicate template or redundant doc was added.
- [ ] No raw local workflow state was published.
- [ ] No temporary debug material remains.

## Risks

- 

## Codex Handoff

- workflow:
- task:
- canonical output:
- publication_status: open-awaiting-human-test | approved-by-human-to-merge | merged

