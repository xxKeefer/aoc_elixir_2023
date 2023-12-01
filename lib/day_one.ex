defmodule DayOne do
  import NimbleParsec

  def main(target) do
    case File.read("data/#{target}/day_one.txt") do
      {:ok, contents} -> IO.puts(solution(contents))
      {:error, error} -> IO.puts("#{error}")
    end
  end

  def solution(content) do
    content
    |> String.split("\n")
    |> Enum.map(&clean(&1))
    |> Enum.map(&elem(&1, 1))
    |> Enum.map(&Enum.join(&1))
    |> Enum.map(&parse(&1))
    |> Enum.map(&elem(&1, 1))
    |> Enum.map(fn list -> "#{List.first(list)}#{List.last(list)}" end)
    |> Enum.map(&String.to_integer(&1))
    |> List.foldl(0, fn elem, acc -> elem + acc end)
  end

  cleanUp =
    choice([
      string("oneight") |> replace("oneeight"),
      string("threeight") |> replace("threeeight"),
      string("fiveight") |> replace("fiveeight"),
      string("nineight") |> replace("nineeight"),
      string("twone") |> replace("twoone"),
      string("eightwo") |> replace("eighttwo"),
      string("eighthree") |> replace("eightthree"),
      string("sevenine") |> replace("sevennine"),
      ascii_string([?a..?z, ?1..?9], 1)
    ])

  numberish =
    choice([
      ascii_string([?1..?9], 1),
      string("one") |> replace("1"),
      string("two") |> replace("2"),
      string("three") |> replace("3"),
      string("four") |> replace("4"),
      string("five") |> replace("5"),
      string("six") |> replace("6"),
      string("seven") |> replace("7"),
      string("eight") |> replace("8"),
      string("nine") |> replace("9")
    ])

  defparsecp(
    :clean,
    repeat(eventually(cleanUp))
  )

  defparsecp(
    :parse,
    repeat(eventually(numberish))
  )
end
