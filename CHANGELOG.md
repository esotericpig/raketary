# Changelog | Raketary

- [Keep a Changelog](https://keepachangelog.com/en/1.1.0),
- [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [[Unreleased]](https://github.com/esotericpig/raketary/compare/v0.2.5...HEAD)

## [0.2.5] - 2025-06-06
### Fixed
- Fixed long opts with a dash not working (e.g., `--dry-run`).

### Changed
- Updated Gems.
- Updated Readme.
- Applied new RuboCop suggestions.
- Renamed Git branch `master` to `main`.

## [0.2.4] - 2021-06-22
### Changed
- Updated raketeer Gem for `bump` command.

## [0.2.3] - 2021-06-18
### Changed
- Updated raketeer Gem.

## [0.2.2] - 2021-06-16
### Changed
- Formatted code with RuboCop.
- Updated Gems.

## [0.2.1] - 2020-03-04
### Fixed
- Added back `irb` gem to Gemspec.

## [0.2.0] - 2020-03-04
### Added
- Added `GHPSyncCmd` for syncing YARDoc to GitHub Pages.
    - Calls `rsync` to sync `./doc/` to another local directory.
    - File: `lib/raketary/ghp_sync_cmd.rb`.
    - Sub cmd: `ghp_sync`.

### Changed
- Renamed `App*` classes (`app_*.rb` files) to `*Cmd` (`*_cmd.rb`) since they extend `Cmd`, not `App`.

## [0.1.3] - 2020-03-02
### Changed
- Changed AppGitHubPkg logic to not check if username is nil (minor; not a bug).

## [0.1.2] - 2020-03-01
### Added
- Added `github_pkg` sub command using AppGitHubPkg & Raketeer::GitHubPkgTask.
    - This will publish/push your `pkg/*.gem` release(s) to GitHub Packages.

### Changed
- Updated Gemfile.lock.

### Fixed
- Fixed AppBump (`bump` sub command) to bump the bundle after bumping all.
    - Before this fix, it required you calling `bump` twice on the command line.

## [0.1.1] - 2019-12-18
### Changed
- Added more info to CHANGELOG, README, TODO.

## [0.1.0] - 2019-08-06
Initial release.
