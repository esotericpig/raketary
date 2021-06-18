# Changelog | Raketary

All notable changes to this project will be documented in this file.

Format is based on [Keep a Changelog v1.0.0](https://keepachangelog.com/en/1.0.0),
and this project adheres to [Semantic Versioning v2.0.0](https://semver.org/spec/v2.0.0.html).

## [[Unreleased]](https://github.com/esotericpig/raketary/compare/v0.2.3...HEAD)
-


## [v0.2.3] - 2021-06-18
### Changed
- Updated raketeer gem.


## [v0.2.2] - 2021-06-16
### Changed
- Formatted code with RuboCop.
- Updated Gems.


## [v0.2.1] - 2020-03-04
### Fixed
- Added back `irb` gem to Gemspec


## [v0.2.0] - 2020-03-04
### Added
- Added `GHPSyncCmd` for syncing YARDoc to GitHub Pages
    - Calls `rsync` to sync `./doc/` to another local directory
    - File: `lib/raketary/ghp_sync_cmd.rb`
    - Sub cmd: `ghp_sync`

### Changed
- Renamed `App*` classes (`app_*.rb` files) to `*Cmd` (`*_cmd.rb`) since they extend `Cmd`, not `App`


## [v0.1.3] - 2020-03-02
### Changed
- Changed AppGitHubPkg logic to not check if username is nil (minor; not a bug)


## [v0.1.2] - 2020-03-01
### Added
- Added `github_pkg` sub command using AppGitHubPkg & Raketeer::GitHubPkgTask
    - This will publish/push your `pkg/*.gem` release(s) to GitHub Packages

### Changed
- Updated Gemfile.lock

### Fixed
- Fixed AppBump (`bump` sub command) to bump the bundle after bumping all
    - Before this fix, it required you calling `bump` twice on the command line


## [v0.1.1] - 2019-12-18
### Changed
- Added more info to CHANGELOG, README, TODO


## [v0.1.0] - 2019-08-06
### Added
- .gitignore
- CHANGELOG.md
- Gemfile
- Gemfile.lock
- LICENSE.txt
- Rakefile
- raketary.gemspec
- README.md
- TODO.md
- bin/raketary
- lib/raketary.rb
- lib/raketary/app.rb
- lib/raketary/app_bump.rb
- lib/raketary/app_irb.rb
- lib/raketary/app_nokogiri.rb
- lib/raketary/app_run.rb
- lib/raketary/cmd.rb
- lib/raketary/errors.rb
- lib/raketary/sub_cmd.rb
- lib/raketary/version.rb
