defmodule Hsl do
  defstruct hue: {nil, :degrees},
            saturation: {nil, 255},
            lightness: {nil, 255}

  defmodule Math do
    def max(list), do: Enum.max(list)
    def min(list), do: Enum.min(list)

    def average(list) do
      Enum.sum(list) / length(list)
    end

    def to_degrees(radians) do
      half_circle = 180

      case radians * half_circle do
        value when value < 0 -> value + 360
        value -> value
      end
    end
  end

  defmodule Hue do
    def from(red, green, blue) do
      alpha = alpha(red, green, blue)
      beta = beta(red, green, blue)

      angle =
        beta
        |> :math.atan2(alpha)
        |> Math.to_degrees()

      {angle, :degrees}
    end

    defp alpha(red, green, blue) do
      numerator = green + blue
      right = numerator / 2
      left = red
      left - right
    end

    defp beta(_, green, blue) do
      left = :math.sqrt(3) / 2
      right = green - blue
      left * right
    end
  end

  defmodule Lightness do
    def from(red, green, blue, scale \\ 255) do
      max = Math.max([red, green, blue])
      min = Math.min([red, green, blue])
      average = Math.average([max, min])
      {average, scale}
    end

    # scale from 0,1
    def relative_luminance({lightness, scale}) do
      {lightness / scale, :unit}
    end
    
    def relative_luminance(red, green, blue, \\ :sRGB) do
      0.2126 * red + 0.7152 * green + 0.0722 * blue
    end
  end

  defmodule Saturation do
    def from({value, scale}, _) when value == 0, do: {value, scale}
    def from({value, scale}, _) when value == scale, do: {value, scale}

    def from({lightness, scale}, max) do
      unit_lightness = lightness / scale
      max_as_percent = max / scale * 100
      distance = 1 - abs(2 * unit_lightness - 1)
      percent_of_distance = max_as_percent / distance
      {percent_of_distance, scale}
    end
  end

  def from_rgb({red, green, blue}), do: from_rgb(red, green, blue)

  def from_rgb(red, green, blue) do
    hue = Hue.from(red, green, blue)
    lightness = Lightness.from(red, green, blue)
    saturation = Saturation.from(lightness, Math.max([red, green, blue]))
    %Hsl{hue: hue, saturation: saturation, lightness: lightness}
  end

  def contrast_ratio(first, second) do
    {one_relative, :unit} = Lightness.relative_luminance(first.lightness)
    {two_relative, :unit} = Lightness.relative_luminance(second.lightness)
    both = [one_relative, two_relative]
    
    # from the WCAG standard
    lightest = Math.max(both) + 0.05
    darkest = Math.min(both) + 0.05
    lightest / darkest
  end

  def sufficient_contrast?(first, second, level \\ :aa)

  def sufficient_contrast?(first, second, :aa) do
    contrast_ratio(first, second) > 4.5
  end

  def sufficient_contrast?(first, second, :aaa) do
    contrast_ratio(first, second) > 7.1
  end
end

