# Markdown Table Formatter

![](https://img.shields.io/badge/license-MIT-blue.svg)
![](https://travis-ci.org/crispgm/markdown-table-formatter.svg)
[![Code Climate](https://codeclimate.com/github/crispgm/markdown-table-formatter/badges/gpa.svg)](https://codeclimate.com/github/crispgm/markdown-table-formatter)
[![Test Coverage](https://codeclimate.com/github/crispgm/markdown-table-formatter/badges/coverage.svg)](https://codeclimate.com/github/crispgm/markdown-table-formatter/coverage)

Format tables in GitHub Flavored Markdown

## Usage

1. Install
    
    ```
    $ bundle install
    ```

2. Run

    ```
    $ echo "|key|value|
|-|-|
|David|Zhang|
|Zhongbo|Li|
|Linus|Torvalds|
" | bundle exec bin/markdown-table-formatter
    ```

3. Output

    ```
    | key     | value    |
    |---------|----------|
    | David   | Zhang    |
    | Zhongbo | Li       |
    | Linus   | Torvalds |
    ```