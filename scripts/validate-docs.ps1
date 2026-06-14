$ErrorActionPreference = 'Stop'

$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path

$requiredFiles = @(
  'README.md',
  'AGENTS.md',
  'CHANGELOG.md',
  'LICENSE',
  'docs/quick-start.md',
  'docs/operating-rules.md',
  'docs/multi-dialog-rules.md',
  'docs/publication-boundaries.md',
  'docs/maintenance.md',
  'docs/examples/empty-repo-bootstrap.md',
  'docs/examples/sanitized-console-workflow.md',
  'docs/decisions/ADR-001-use-file-based-control-plane.md',
  'docs/decisions/ADR-002-github-first-collaboration.md',
  'docs/decisions/ADR-003-serial-codex-app-session-orchestration.md',
  'docs/decisions/ADR-004-require-real-role-threads-for-workflow-validation.md',
  'docs/decisions/ADR-005-human-gated-main-merge-and-controller-patience.md',
  'templates/workflow-state.template.md',
  'templates/session-registry.template.md',
  'templates/agent-registry.template.md',
  'templates/shared-task.template.md',
  'templates/task.template.md',
  'templates/worker-prompt.template.md',
  'templates/handoff.template.md',
  'templates/github-issue.template.md',
  'templates/pull-request.template.md',
  'dashboards/control-board.template.md',
  '.github/workflows/validate.yml',
  '.github/ISSUE_TEMPLATE/workflow-task.md',
  '.github/pull_request_template.md'
)

$failures = New-Object System.Collections.Generic.List[string]

foreach ($relative in $requiredFiles) {
  $path = Join-Path $root $relative
  if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
    $failures.Add("Missing required file: $relative")
  }
}

$markdownFiles = Get-ChildItem -LiteralPath $root -Recurse -File -Include *.md |
  Where-Object { $_.FullName -notmatch '\\.git\\' }

foreach ($file in $markdownFiles) {
  try {
    [void][System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
  } catch {
    $failures.Add("Markdown file is not UTF-8 readable: $($file.FullName.Substring($root.Length + 1))")
  }
}

$privateFragments = @(
  (-join ([char[]](108,122,98,45,105,111,116))),
  (-join ([char[]](116,111,100,111,45,100,97,105,108,121))),
  (-join ([char[]](105,111,116,45,97,103,101,110,116,45,100,101,109,111))),
  'project-registry.md'
)

$credentialPattern = (-join ([char[]](115,101,99,114,101,116))) + '|' +
  (-join ([char[]](112,97,115,115,119,111,114,100))) + '|' +
  (-join ([char[]](97,112,105,91,95,45,93,63,107,101,121))) + '|' +
  (-join ([char[]](116,111,107,101,110))) + '|' +
  (-join ([char[]](66,69,71,73,78,32,80,82,73,86,65,84,69)))
$stalePattern = (-join ([char[]](84,79,68,79))) + '|' +
  (-join ([char[]](84,66,68))) + '|' +
  (-join ([char[]](21344,20301))) + '|' +
  (-join ([char[]](20020,26102,100,101,98,117,103)))

$filesToScan = Get-ChildItem -LiteralPath $root -Recurse -File |
  Where-Object {
    $_.FullName -notmatch '\\.git\\' -and
    $_.FullName -notmatch '\\docs\\workflows\\' -and
    $_.FullName -ne $PSCommandPath
  }

foreach ($file in $filesToScan) {
  $relative = $file.FullName.Substring($root.Length + 1)
  $text = [System.IO.File]::ReadAllText($file.FullName)

  if ($text -match $credentialPattern) {
    $failures.Add("Sensitive marker found in $relative")
  }

  if ($text -match $stalePattern) {
    $failures.Add("Stale work marker found in $relative")
  }

  foreach ($fragment in $privateFragments) {
    if ($text.Contains($fragment)) {
      $failures.Add("Private source fragment '$fragment' found in $relative")
    }
  }
}

$requiredPhrases = @{
  'AGENTS.md' = @('human testing', 'Acceptance must be independent')
  'docs/multi-dialog-rules.md' = @('Controller patience', 'process-failed-single-thread-impersonation')
  'templates/workflow-state.template.md' = @('human_merge_authorization', 'Controller Scheduling Policy')
  'templates/handoff.template.md' = @('publication_status', 'strict_mode_compliance')
  '.github/pull_request_template.md' = @('Human merge gate', 'PR left open for human testing')
}

foreach ($entry in $requiredPhrases.GetEnumerator()) {
  $path = Join-Path $root $entry.Key
  if (-not (Test-Path -LiteralPath $path)) { continue }
  $text = [System.IO.File]::ReadAllText($path)
  foreach ($phrase in $entry.Value) {
    if (-not $text.Contains($phrase)) {
      $failures.Add("Required phrase '$phrase' missing from $($entry.Key)")
    }
  }
}

if ($failures.Count -gt 0) {
  $failures | ForEach-Object { Write-Error $_ }
  exit 1
}

Write-Host "Documentation validation passed."
