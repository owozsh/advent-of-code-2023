defmodule AdventOfCode.Days.TwoTest do
  use ExUnit.Case
  doctest AdventOfCode

  import AdventOfCode.Days.Two

  @simple_input "Game 1: 30 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"

  @complex_input """
    Game 1: 30 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
    Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
    Game 3: 20 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
    Game 4: 1 green, 20 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
    Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
  """

  test "get_max_cubes/2" do
    assert get_max_cubes(:blue, @simple_input) == 30
  end

  test "split_lines/1" do
    line = "a 1: 40 a,x"
    assert split_lines("#{line}\n#{line}\n") == [line, line]
  end

  test "validate_line/1" do
    assert validate_line(@simple_input) ==
             {:error, 1}
  end

  test "simple main/1" do
    result = main(@simple_input)

    assert result == [{:error, 1}]
  end

  test "multiple main/1" do
    result =
      main(@complex_input)

    assert result == [{:error, 1}, {:ok, 2}, {:error, 3}, {:error, 4}, {:ok, 5}]
  end
end
