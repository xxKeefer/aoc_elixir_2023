defmodule DayTwo do
  import NimbleParsec

  defparsec(
    :parse,
    ignore(string("Game "))
    |> integer(min: 1, max: 3)
    |> string(": ")
    |> repeat(
      lookahead_not(eos())
      |> choice([
        string(";"),
        string(" "),
        ignore(string(", ")),
        integer(min: 1, max: 2)
        |> ignore(string(" "))
        |> choice([
          string("red"),
          string("green"),
          string("blue")
        ])
      ])
    )
  )

  def part_one(target) do
    case File.read("data/day_two/#{target}1.txt") do
      {:ok, contents} -> IO.puts(solution(contents))
      {:error, error} -> IO.puts("#{error}")
    end
  end

  def solution(content) do
    content
    |> String.split("\n")
    |> Enum.map(fn x -> parse(x) end)
    |> Enum.map(fn x -> elem(x, 1) end)
    |> Enum.map(fn x -> Enum.chunk_every(x, 2) end)
    |> Enum.filter(fn x -> is_possible(x) end)
    |> Enum.map(fn x -> List.first(x) end)
    |> Enum.map(fn x -> List.first(x) end)
    |> Enum.sum()
  end

  def is_possible(values) do
    values
    |> Enum.map(fn x -> verify(x) end)
    |> Enum.reduce(true, fn bool, acc -> bool and acc end)
  end

  def verify([cubes, "red"]), do: cubes <= 12
  def verify([cubes, "green"]), do: cubes <= 13
  def verify([cubes, "blue"]), do: cubes <= 14
  def verify(_), do: true
end
