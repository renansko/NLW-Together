defmodule Wabanex.IMCTest do
  use ExUnit.Case, async: true

  alias Wabanex.IMC
  describe "calculate/1" do
  test "When the file exists, returns the data" do

    params = %{"filename" => "students.csv"}

    response = IMC.calculate(params)

    expected_response = {:ok,
             %{
              "Alex" => 23.437499999999996,
              "Bueno" => 22.857142857142858,
              "Diego" => 23.04002019946976,
              "Juan" => 26.234567901234566,
              "Rafael" => 24.897060231734173
            }}

    assert expected_response == response
  end
  test "When the wrong file has given, return a error" do

    params = %{"filename" => "banana.csv"}

    response = IMC.calculate(params)

    expected_response = {:error, "deu erro ai amigao"}

    assert expected_response == response
  end
end
end
