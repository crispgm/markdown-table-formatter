# Markdown Table Formatter

![GitHub CI](https://github.com/crispgm/markdown-table-formatter/workflows/build/badge.svg)
[![Maintainability](https://api.codeclimate.com/v1/badges/e2e707a2174b3fd91fc0/maintainability)](https://codeclimate.com/github/crispgm/markdown-table-formatter/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/e2e707a2174b3fd91fc0/test_coverage)](https://codeclimate.com/github/crispgm/markdown-table-formatter/test_coverage)

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
