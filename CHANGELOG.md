# Changelog | Raketary

Format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [[Unreleased]](https://github.com/esotericpig/raketary/compare/v0.1.2...master)

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
