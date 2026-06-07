# Updates

> Prowl keeps itself current via Sparkle. Channels, auto-check, and manual checks.

**Keywords:** updates, sparkle, auto-update, check for updates, channel, stable, tip, version, ⌘⇧U

**Related:** [settings](settings.md)

## What it is

Prowl uses the **Sparkle** framework for auto-updates. Releases are notarized.

- **Check now:** `⌘⇧U` (`check_for_updates`), or Command Palette → "Check for
  Updates", or Settings → Updates → "Check for Updates Now".
- **Background checks:** if `updatesAutomaticallyCheckForUpdates` is on, Prowl
  checks periodically (roughly hourly). When a background check finds an update, a
  badge appears on the notification bell; clicking it opens the standard Sparkle
  dialog.
- **On quit with a downloaded update:** Prowl offers to install or defer.

## Channels

`updateChannel` selects the release track: **Stable** (default) or **Tip**. Choose
in Settings → Updates. (Day-to-day, Stable is the published track.)

## Settings

- `updateChannel` — `stable` or `tip`.
- `updatesAutomaticallyCheckForUpdates` — background checks (default on).
- `updatesAutomaticallyDownloadUpdates` — auto-download in the background.

## Install via Homebrew

Prowl is also distributed as a cask: `brew install --cask onevcat/tap/prowl`. The
in-app Sparkle updater and Homebrew are separate channels.

## Gotchas for agents

- This updates **the Prowl app itself**, not your projects or agents.
- A bell badge that isn't a notification may be an **available update** — check
  Settings → Updates.
