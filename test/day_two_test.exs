defmodule DayTwoTest do
  use ExUnit.Case
  doctest DayTwo

  test "part one - single game - valid" do
    assert DayTwo.solution("Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green") == 1
    assert DayTwo.solution("Game 60: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green") == 60
    assert DayTwo.solution("Game 100: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green") == 100
  end

  test "part one - single game - failing" do
    assert DayTwo.solution("Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 20 green") == 0
    assert DayTwo.solution("Game 60: 3 blue, 4 red; 19 red, 2 green, 6 blue; 2 green") == 0
    assert DayTwo.solution("Game 100: 30 blue, 4 red; 1 red, 2 green, 6 blue; 2 green") == 0
  end

  test "part one - full example" do
    input = """
    Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
    Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
    Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
    Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
    Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
    """

    assert DayTwo.solution(input |> String.trim_trailing("\n")) == 8
  end

  test "part one - random manual sample" do
    input = """
    Game 32: 1 red, 1 blue, 6 green; 10 blue, 4 green; 1 red, 5 blue; 9 blue, 3 green
    Game 33: 4 red; 3 red; 2 red, 1 green, 1 blue; 1 green; 1 blue, 1 red
    Game 34: 2 green, 9 blue, 1 red; 5 blue, 7 green, 1 red; 2 green, 1 red, 16 blue; 1 blue, 5 green, 6 red
    Game 35: 11 red, 10 blue; 2 blue, 12 green, 12 red; 3 green, 6 red, 6 blue; 14 blue, 10 green, 1 red
    Game 36: 2 blue, 3 red, 15 green; 2 blue, 6 green, 2 red; 14 blue, 4 red, 7 green; 13 blue, 12 green, 2 red
    Game 37: 6 green, 14 blue, 7 red; 7 blue, 2 red, 6 green; 1 blue, 2 green, 6 red
    Game 38: 2 green, 15 red, 2 blue; 14 red, 1 blue; 14 red, 2 green, 12 blue
    """

    assert DayTwo.solution(input |> String.trim_trailing("\n")) == 32 + 33 + 35 + 37
  end
end
