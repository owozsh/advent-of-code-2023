defmodule AdventOfCode.Days.Two do
  def main(input) do
    input
    |> split_lines()
    |> Enum.map(&validate_line(&1))
  end

  def validate_line(line) do
    round = Regex.run(~r/Game (\d+)/, line) |> List.last() |> String.to_integer()

    is_valid? =
      [:red, :green, :blue]
      |> Enum.map(&(get_max_cubes(&1, line) |> possible?(&1)))
      |> Enum.all?()

    if is_valid?, do: {:ok, round}, else: {:error, round}
  end

  def possible?(cubes, :red), do: cubes <= 12
  def possible?(cubes, :green), do: cubes <= 13
  def possible?(cubes, :blue), do: cubes <= 14

  def get_max_cubes(color, line) do
    Regex.scan(~r/(\d+) #{color}/, line)
    |> nil_to_list()
    |> Enum.map(&(&1 |> List.last() |> String.to_integer()))
    |> Enum.max()
  end

  def split_lines(text) do
    text
    |> String.trim()
    |> String.split(~r/\n+/)
  end

  def nil_to_list(nil), do: []
  def nil_to_list(list), do: list
end
