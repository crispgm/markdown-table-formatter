class MarkdownTableFormatter
  
  attr_reader :all_rows, :column_width, :result

  def initialize(input = "")
    attach(input)
  end

  def attach(input)
    @result = ""
    @all_rows = Array.new(input.split("\n").size)

    linenum = 0
    input.strip!
    input.each_line do |line|
      if linenum == 1
        if !valid_seperator(line)
          puts "Invalid Seperator: #{line}"
          return false
        end
      else
        if valid_line(line)
          @all_rows[linenum] = fetch_line_section(line)
          if (@all_rows[linenum].size != @all_rows[0].size)
            puts "Elements num mismatch with table head"
            return false
          end
          if linenum == 0
            @column_width = init_column_width(linenum)
          end
          calc_column_width(linenum)
        else
          puts "Invalid Line: #{line}"
          return false
        end
      end  
    
      linenum = linenum + 1
    end
  end

  def format
    linenum = 0
    @result = ""
    
    @all_rows.each do |row|
      @result << "|"
      if linenum == 1
        @column_width.each do |col|
          @result << "-" * (col + 2)
          @result << "|"
        end
      else
        col_num = 0
        row.each do |item|
          @result << " "
          @result << item
          @result << " " * (@column_width[col_num] - view_size(item))
          @result << " |"
          col_num = col_num + 1
        end
      end
      @result << "\n"
      linenum = linenum + 1
    end
  end

  def output
    print @result
  end

  private

  def init_column_width(linenum)
    Array.new(@all_rows[linenum].size) do |item|
      item = 0
    end
  end

  def calc_column_width(linenum)
    item_index = 0
    @all_rows[linenum].each do |item|
      if view_size(item) > @column_width[item_index]
        @column_width[item_index] = view_size(item)
      end
      item_index = item_index + 1
    end
  end

  def view_size(item)
    (item.bytesize - item.size) / 2 + item.size
  end

  def valid_line(line)
    if /^(\|(.)*)*\|$/.match(line) != nil
      true
    else
      false
    end
  end

  def valid_seperator(line)
    if /^(\|(\-)*)*\|$/.match(line) != nil
      true
    else
      false
    end
  end

  def fetch_line_section(line)
    temp = line[1..-2]
    temp.split("|").each do |item|
      item.strip!
    end
  end

end