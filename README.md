# Raketary

[![Gem Version](https://badge.fury.io/rb/raketary.svg)](https://badge.fury.io/rb/raketary)
[![Source Code](https://img.shields.io/badge/source-github-%23211F1F.svg)](https://github.com/esotericpig/raketary)
[![Changelog](https://img.shields.io/badge/changelog-md-%23A0522D.svg)](CHANGELOG.md)
[![License](https://img.shields.io/github/license/esotericpig/raketary.svg)](LICENSE.txt)

CLI app for commonly-used Rake tasks.

Includes:

- [Raketeer](https://github.com/esotericpig/raketeer)
- [YardGhurt](https://github.com/esotericpig/yard_ghurt)

![Demo of Raketary on the command line](https://github.com/esotericpig/esotericpig.github.io/blob/main/pics/raketary_demo.gif?raw=true)

## // Contents

- [Installing](#-installing)
- [Using](#-using)
  - [Bump](#-bump)
  - [GitHub Pkg](#-github-pkg)
  - [GitHub Pages Sync](#-github-pages-sync)
- [Hacking](#-hacking)
- [License](#-license)

## [//](#-contents) Installing

Pick your poison...

With the RubyGems CLI package manager:

```bash
gem install raketary
```

From source:

```bash
git clone --depth 1 'https://github.com/esotericpig/raketary.git'
cd raketary
bundle install
bundle exec rake install:local
```

## [//](#-contents) Using

```bash
$ raketary
Usage: raketary [options] [command] [options]...

Commands:
    bump                             Bump your project's version
    ghp_sync                         Sync YARDoc to GitHub Pages repo
    github_pkg                       Publish your project's gem(s) to GitHub Packages
    irb                              Open an irb session loaded with your library
    nokogiri                         Install Nokogiri libs
    run                              Run your project's main file: raketary run -- --version

Options:
    -h, --help                       show this help
    -v, --version                    show the version of raketary
```

### [//](#-contents) Bump

```bash
$ raketary bump
[bump] Options:
    -n, --dry-run                    do a dry run (do NOT write to files)
    -s, --strict                     enforce semantic versioning (i.e., \d+\.\d+\.\d+.*)

    -v, --ver [STR]                  show/set the version (e.g.: '1.2.3-alpha.4+beta.5') (default: show)
    -m, --major [INT,STR]            bump/set the major number (e.g.: +2, 4) (default: +1)
    -i, --minor [INT,STR]            bump/set the minor number (e.g.: +2, 4) (default: +1)
    -p, --patch [INT,STR]            bump/set the patch number (e.g.: +2, 4) (default: +1)
    -r, --pre [STR]                  set/erase the pre-release extension (e.g.: 'alpha.4') (default: erase)
    -b, --build [STR]                set/erase the the build metadata (e.g.: 'beta.5') (default: erase)
    -u, --bundle                     bump the Gemfile.lock version

    -h, --help                       show this help
    -x, --example                    show some examples
```

```bash
$ raketary bump -x
raketary bump -v  # Show the current version
raketary bump -n  # Do a dry run for any task (will NOT write to files)

raketary bump -v '1.2.3-alpha.4-beta.5'  # Set the version manually
raketary bump -m 1 -i 2 -p 3             # Set the version numbers
raketary bump -r 'alpha.4' -b 'beta.5'   # Set the version extensions
raketary bump -m -i -p                   # Bump the version numbers by 1
raketary bump -m +2 -i +3 -p +4          # Bump the version numbers by X

raketary bump -m            # Bump the major number by 1
raketary bump -m 1          # Set the major number to 1
raketary bump -m +2         # Bump the major number by 2
raketary bump -i            # Bump the minor number by 1
raketary bump -i 2          # Set the minor number to 2
raketary bump -i +3         # Bump the minor number by 3
raketary bump -p            # Bump the patch number by 1
raketary bump -p 3          # Set the patch number to 3
raketary bump -p +4         # Bump the patch number by 4
raketary bump -r            # Erase the pre-release extension
raketary bump -r 'alpha.4'  # Set the pre-release extension
raketary bump -b            # Erase the build metadata
raketary bump -b 'beta.5'   # Set the build metadata
raketary bump -u            # Bump the Gemfile.lock version
```

### [//](#-contents) GitHub Pkg

```bash
$ raketary github_pkg -h
[github_pkg] Options:
    -u, --user [STR]                 set the GitHub username
    -h, --help                       show this help
```

### [//](#-contents) GitHub Pages Sync

```bash
$ raketary ghp_sync -h
[ghp_sync] Options:
    -g, --ghp-dir STR                the destination (GitHub Pages) directory to sync "doc/" to

    -d, --deploy                     actually deploy (don't just do a dry-run)
    -s, --sync-args STR              additional args to pass to the sync command

    -h, --help                       show this help
```

## [//](#-contents) Hacking

```bash
git clone 'https://github.com/esotericpig/raketary.git'
cd raketary
bundle install
bundle exec rake -T
```

## [//](#-contents) License

[GNU LGPL v3+](LICENSE.txt)

> Raketary (<https://github.com/esotericpig/raketary>)  
> Copyright (c) 2019-2025 Bradley Whited  
> 
> Raketary is free software: you can redistribute it and/or modify  
> it under the terms of the GNU Lesser General Public License as published by  
> the Free Software Foundation, either version 3 of the License, or  
> (at your option) any later version.  
> 
> Raketary is distributed in the hope that it will be useful,  
> but WITHOUT ANY WARRANTY; without even the implied warranty of  
> MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the  
> GNU Lesser General Public License for more details.  
> 
> You should have received a copy of the GNU Lesser General Public License  
> along with Raketary.  If not, see <https://www.gnu.org/licenses/>.  
