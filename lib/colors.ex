defmodule Colors do
  def show() do
    range = 0..5
    message = "hello"
    message_length = String.length(message)
    cell_width = 5 # 'G=?  '
    header = Enum.join(Enum.map(range, fn value -> 
      " B=#{value} "
    end), " ")

    Enum.each(range, fn one ->
      red_message = underline() <> "R=#{one}" <> reset()
      
      IO.write(red_message)
      IO.write("  ")
      IO.write(underline() <> header <> reset())
      IO.write("\n")

      Enum.each(range, fn two ->
        green_message = underline() <> "G=#{two}" <> reset() <> "  "
        IO.write(green_message)
        
        Enum.each(range, fn three ->
          string = IO.ANSI.color(one, two, three) <> message <> IO.ANSI.reset()
          IO.write(string <> " ")
        end)

        IO.write("\n")
      end)
      
      IO.write("\n")
    end)
  end

  def black(), do: apply(IO.ANSI, :black, [])
  def black_background(), do: apply(IO.ANSI, :black_background, [])
  def blue(), do: apply(IO.ANSI, :blue, [])
  def blue_background(), do: apply(IO.ANSI, :blue_background, [])
  def bright(), do: apply(IO.ANSI, :bright, [])
  def clear(), do: apply(IO.ANSI, :clear, [])
  def clear_line(), do: apply(IO.ANSI, :clear_line, [])
  def color_background(), do: apply(IO.ANSI, :color_background, [])
  def conceal(), do: apply(IO.ANSI, :conceal, [])
  def crossed_out(), do: apply(IO.ANSI, :crossed_out, [])
  def cursor(), do: apply(IO.ANSI, :cursor, [])
  def cursor_down(), do: apply(IO.ANSI, :cursor_down, [])
  def cursor_left(), do: apply(IO.ANSI, :cursor_left, [])
  def cursor_right(), do: apply(IO.ANSI, :cursor_right, [])
  def cursor_up(), do: apply(IO.ANSI, :cursor_up, [])
  def cyan(), do: apply(IO.ANSI, :cyan, [])
  def cyan_background(), do: apply(IO.ANSI, :cyan_background, [])
  def default_background(), do: apply(IO.ANSI, :default_background, [])
  def default_color(), do: apply(IO.ANSI, :default_color, [])
  def encircled(), do: apply(IO.ANSI, :encircled, [])
  def faint(), do: apply(IO.ANSI, :faint, [])
  def font_1(), do: apply(IO.ANSI, :font_1, [])
  def font_2(), do: apply(IO.ANSI, :font_2, [])
  def font_3(), do: apply(IO.ANSI, :font_3, [])
  def font_4(), do: apply(IO.ANSI, :font_4, [])
  def font_5(), do: apply(IO.ANSI, :font_5, [])
  def font_6(), do: apply(IO.ANSI, :font_6, [])
  def font_7(), do: apply(IO.ANSI, :font_7, [])
  def font_8(), do: apply(IO.ANSI, :font_8, [])
  def font_9(), do: apply(IO.ANSI, :font_9, [])
  def framed(), do: apply(IO.ANSI, :framed, [])
  def green(), do: apply(IO.ANSI, :green, [])
  def green_background(), do: apply(IO.ANSI, :green_background, [])
  def home(), do: apply(IO.ANSI, :home, [])
  def inverse(), do: apply(IO.ANSI, :inverse, [])
  def inverse_off(), do: apply(IO.ANSI, :inverse_off, [])
  def italic(), do: apply(IO.ANSI, :italic, [])
  def light_black(), do: apply(IO.ANSI, :light_black, [])
  def light_black_background(), do: apply(IO.ANSI, :light_black_background, [])
  def light_blue(), do: apply(IO.ANSI, :light_blue, [])
  def light_blue_background(), do: apply(IO.ANSI, :light_blue_background, [])
  def light_cyan(), do: apply(IO.ANSI, :light_cyan, [])
  def light_cyan_background(), do: apply(IO.ANSI, :light_cyan_background, [])
  def light_green(), do: apply(IO.ANSI, :light_green, [])
  def light_green_background(), do: apply(IO.ANSI, :light_green_background, [])
  def light_magenta(), do: apply(IO.ANSI, :light_magenta, [])
  def light_magenta_background(), do: apply(IO.ANSI, :light_magenta_background, [])
  def light_red(), do: apply(IO.ANSI, :light_red, [])
  def light_red_background(), do: apply(IO.ANSI, :light_red_background, [])
  def light_white(), do: apply(IO.ANSI, :light_white, [])
  def light_white_background(), do: apply(IO.ANSI, :light_white_background, [])
  def light_yellow(), do: apply(IO.ANSI, :light_yellow, [])
  def light_yellow_background(), do: apply(IO.ANSI, :light_yellow_background, [])
  def magenta(), do: apply(IO.ANSI, :magenta, [])
  def magenta_background(), do: apply(IO.ANSI, :magenta_background, [])
  def no_underline(), do: apply(IO.ANSI, :no_underline, [])
  def normal(), do: apply(IO.ANSI, :normal, [])
  def not_framed_encircled(), do: apply(IO.ANSI, :not_framed_encircled, [])
  def not_italic(), do: apply(IO.ANSI, :not_italic, [])
  def not_overlined(), do: apply(IO.ANSI, :not_overlined, [])
  def overlined(), do: apply(IO.ANSI, :overlined, [])
  def primary_font(), do: apply(IO.ANSI, :primary_font, [])
  def red(), do: apply(IO.ANSI, :red, [])
  def red_background(), do: apply(IO.ANSI, :red_background, [])
  def reset(), do: apply(IO.ANSI, :reset, [])
  def reverse(), do: apply(IO.ANSI, :reverse, [])
  def reverse_off(), do: apply(IO.ANSI, :reverse_off, [])
  def underline(), do: apply(IO.ANSI, :underline, [])
  def white(), do: apply(IO.ANSI, :white, [])
  def white_background(), do: apply(IO.ANSI, :white_background, [])
  def yellow(), do: apply(IO.ANSI, :yellow, [])
  def yellow_background(), do: apply(IO.ANSI, :yellow_background, [])
end

