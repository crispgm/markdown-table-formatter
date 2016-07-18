require_relative "helper"
require_relative "../lib/markdown-table-formatter"

require "minitest/autorun"

class TestFmt < Minitest::Test
  def setup
    @fmt = MarkdownTableFormatter.new
  end

  def test_fmt_normal
    input = <<IN
|key|value|
|-|-|
|David|Zhang|
|Zhongbo|Li|
|Linus|Torvalds|
IN
    output = <<OUT
| key     | value    |
|---------|----------|
| David   | Zhang    |
| Zhongbo | Li       |
| Linus   | Torvalds |
OUT
    @fmt.attach(input)
    @fmt.format
    assert_equal(output, @fmt.result)
  end

  def test_fmt_with_chinese
    input = <<IN
|num|name|   怎么就不行|
|-|-|-|
|0| minos|true|
|1|udw|ok|
|2|aaa  |混合222aaa|
|hohohoho|中文|ahhh|
IN
    output = <<OUT
| num      | name  | 怎么就不行 |
|----------|-------|------------|
| 0        | minos | true       |
| 1        | udw   | ok         |
| 2        | aaa   | 混合222aaa |
| hohohoho | 中文  | ahhh       |
OUT
    @fmt.attach(input)
    @fmt.format
    assert_equal(output, @fmt.result)
  end

  def test_fmt_nil
    @fmt.format
    assert_equal("", @fmt.result)
  end

  def test_fmt_bad_th
    input = <<IN
|a|a
|-|-|
|b|b|
IN
    assert_equal(false, @fmt.attach(input))
  end

  def test_fmt_bad_tr
    input = <<IN
|a|a|
|-|-|
|b|b
IN
    assert_equal(false, @fmt.attach(input))
  end

  def test_fmt_bad_sep
    input = <<IN
|a|a|
|-|-
|b|b|
IN
    assert_equal(false, @fmt.attach(input))
  end

  def test_fmt_mismatch_elements
    input = <<IN
|a|a|
|-|-|
|b|b|c|
|c|c|
IN
    assert_equal(false, @fmt.attach(input))
  end
end
