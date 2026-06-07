# Diff View

> A dedicated window showing what changed in a worktree vs HEAD — review an
> agent's work before you commit.

**Keywords:** diff, diff view, changes, review, working tree, HEAD, split, unified, line changes, ⌘⇧Y, show diff

**Related:** [repositories-and-worktrees](repositories-and-worktrees.md) · [github-pull-requests](github-pull-requests.md) · [command-palette](command-palette.md)

## What it is

The Diff window shows all changes in the selected worktree's working directory
compared against **HEAD** — exactly what an agent has modified. It's a fast way to
review before committing or merging.

**Open:** `⌘⇧Y` (`show_diff`), or Command Palette → "Show Diff". The window is a
persistent singleton (remembers size/position) and auto-refreshes when it regains
focus. `⌘W` closes it.

## What it shows

- A **file list** sidebar of changed files, each with a colored status badge:
  - **M** Modified (orange) · **A** Added/untracked (green) · **D** Deleted (red) ·
    **R** Renamed / **C** Copied (blue) · **?** Unknown (grey).
- The selected file's diff, comparing the **HEAD** version (`git show HEAD:path`)
  against the **on-disk** version.
- Both tracked changes and **untracked new files** are included.

## Modes & interactions

- **Split** (side-by-side, default) or **Unified** view — toggle via the toolbar
  picker.
- Click a file in the list to view its diff.
- Auto-refresh on focus keeps it current as the agent keeps working.

## Line-change badges elsewhere

Repositories can show **line-change badges** (additions/deletions) on worktree
rows, controlled per repo by `observeLineDiffsAutomatically` (on by default).
Disable it for very large repos if it's expensive.

## Availability

Diff is a **git-only** feature — it's unavailable for plain (non-git) folders.

## Gotchas for agents

- The diff is **working-tree vs HEAD**, not vs the base branch — it reflects
  uncommitted changes in that worktree.
- For changes already in a pull request (vs the base branch, with CI), see
  [github-pull-requests](github-pull-requests.md).
