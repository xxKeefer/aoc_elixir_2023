defmodule DayOneTest do
  use ExUnit.Case
  doctest DayOne

  test "small strings" do
    assert DayOne.solution("65z") == 65
    assert DayOne.solution("827") == 87
    assert DayOne.solution("ninesix55") == 95
  end

  test "big strings" do
    assert DayOne.solution("nsstnhvdkxnbsrpnxfknbjffpngz36twofiveseven") == 37
    assert DayOne.solution("nqzrgxhvjzqblvsbhtssrzkvmrppkqfnrvpsltseven74") == 74
    assert DayOne.solution("jszfbjvsthreefive8eight28hpfztclxczsgnksgchd") == 38
  end

  test "tricky strings" do
    assert DayOne.solution("6zfxp") == 66
    assert DayOne.solution("sixsixone2oneone") == 61
    assert DayOne.solution("7xkvvtxvtmltpv") == 77
  end

  test "double combo strings" do
    assert DayOne.solution("oneight") == 18
    assert DayOne.solution("threeight") == 38
    assert DayOne.solution("fiveight") == 58
    assert DayOne.solution("nineight") == 98
    assert DayOne.solution("twone") == 21
    assert DayOne.solution("eightwo") == 82
    assert DayOne.solution("eighthree") == 83
    assert DayOne.solution("sevenine") == 79
  end

  # test "triple combo strings" do
  #   assert DayOne.solution("oneighthreeight") == 18
  #   assert DayOne.solution("nineightwo") == 92
  #   assert DayOne.solution("twoneighthreeight") == 28
  #   assert DayOne.solution("sevenineight") == 78
  # end
end
