require "minitest/autorun"
require_relative "../lib/markdown-table-formatter"

class TestFmt < Minitest::Test
  def setup
  	input = <<IN
|num|name|   怎么就不行|
|-|-|-|
|0| minos|true|
|1|udw|ok|
|2|aaa  |混合222aaa|
|hohohoho|中文|ahhh|
IN
	@output = <<OUT
| num      | name  | 怎么就不行 |
|----------|-------|------------|
| 0        | minos | true       |
| 1        | udw   | ok         |
| 2        | aaa   | 混合222aaa |
| hohohoho | 中文  | ahhh       |
OUT
  	@fmt = MarkdownTableFormatter.new(input)
  end

  def test_fmt
  	@fmt.format
  	assert_equal(@output, @fmt.result)
  end
end