class MarkdownTableFormatter
  
  attr_reader :all_rows, :column_width, :result

  def initialize(input)
    @result = ""
    @all_rows = Array.new(input.split("\n").size)

    linenum = 0
    input.strip!
    input.each_line do |line|
      if linenum == 1
        if !valid_seperator(line)
          puts "Invalid Seperator: #{line}"
          exit(1)
        end
      else
        if valid_line(line)
          @all_rows[linenum] = fetch_line_section(line)
          if linenum == 0
            @column_width = Array.new(@all_rows[linenum].size) do |item|
              item = 0
            end
          end
          item_index = 0
          @all_rows[linenum].each do |item|
            if view_size(item) > @column_width[item_index]
              @column_width[item_index] = view_size(item)
            end
            item_index = item_index + 1
          end
        else
          puts "Invalid Line: #{line}"
          exit(1)
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