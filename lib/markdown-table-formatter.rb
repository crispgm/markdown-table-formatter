class MarkdownTableFormatter
  
  attr_reader :all_rows, :column_width

  def initialize(input)
    linenum = 0
    @all_rows = Array.new(input.split("\n").size)
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

  def view_size(item)
    (item.bytesize - item.size) / 2 + item.size
  end

  def format
    linenum = 0
    @all_rows.each do |row|
      print "|"
      if linenum == 1
        @column_width.each do |col|
          print "-" * (col + 2)
          print "|"
        end
      else
        col_num = 0
        row.each do |item|
          print " "
          print item
          print " " * (@column_width[col_num] - view_size(item))
          print " |"
          col_num = col_num + 1
        end
      end
      print "\n"
      linenum = linenum + 1
    end
  end

  def valid_line(line)
    return true if /^(\|(.)*)*\|$/.match(line) != nil

    false
  end

  def valid_seperator(line)
    return true if /^(\|(\-)*)*\|$/.match(line) != nil

    false
  end

  def fetch_line_section(line)
    temp = line[1..-2]
    temp.split("|").each do |item|
      item.strip!
    end
  end

end