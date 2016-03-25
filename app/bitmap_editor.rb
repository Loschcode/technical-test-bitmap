class BitmapEditor

  attr_reader :running, :bitmap

  DEFAULT_COLOR = "0"

  def run

    @running = true
    puts 'type ? for help'

    while running

      print '> '

      input = gets.chomp

      words = input.split("\ ")
      args = words.drop(1)

      begin

        manage_commands(words.first, args)

      rescue

        puts "wrong syntax :( please type `?` for further details"

      end

    end

  end

  private

    def manage_commands(command, args)

      case command

      when '?'
        show_help

      when 'X'
        exit_console

      when 'I'
        generate_map(*args)

      when 'C'
        clear_map

      when 'L'
        change_map(*args)

      when 'S'
        print display_map

      when 'H'
        change_horizontal_segment_map(*args)

      when 'V'
        change_vertical_segment_map(*args)

      else
        puts 'unrecognised command :('

      end

    end

    def display_map

      @bitmap.map { |line| line.join }.join("\n") << "\n" unless bitmap.nil?

    end

    def generate_map(width, height)
      
      return if width.to_i <= 0 || height.to_i <= 0
      
      @bitmap = (1..height.to_i).map do |line|
          [DEFAULT_COLOR] * width.to_i
      end

    end

    def clear_map

      return if @bitmap.nil?

      @bitmap.each do |line|
        line.map! { |row| DEFAULT_COLOR }
      end
 
    end

    def change_map(x, y, color)

      @bitmap[x.to_i-1][y.to_i-1] = color

    end

    def change_horizontal_segment_map(from_column, to_column, row, color)

      @bitmap[row.to_i-1].map!.with_index do |line, index|

        if (from_column.to_i-1..to_column.to_i-1).include? index
          color
        else
          line
        end

      end

    end

    def change_vertical_segment_map(column, from_row, to_row, color)

      (from_row.to_i-1..to_row.to_i-1).map do |row|

        @bitmap[row][column.to_i-1] = color

      end

    end

    def exit_console

      puts 'goodbye!'
      @running = false

    end

    def show_help

      puts """

? - Help
I M N - Create a new M x N image with all pixels coloured white (O).
C - Clears the table, setting all pixels to white (O).
L X Y C - Colours the pixel (X,Y) with colour C.
V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
S - Show the contents of the current image
X - Terminate the session

            """

    end

end
