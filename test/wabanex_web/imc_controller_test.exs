defmodule WabanexWeb.IMCControllerTest do
  use WabanexWeb.ConnCase,async: true

  describe "index/2" do
  test "when all params are valid, returns the imc info", %{conn: conn} do
   params = %{"filename" => "students.csv"}

    response =
      conn
      |> get(Routes.imc_path(conn, :index, params))
      |> json_response(:ok)

      expected_response = %{
        "result" => %{
          "Alex" => 23.437499999999996,
          "Bueno" => 22.857142857142858,
          "Diego" => 23.04002019946976,
          "Juan" => 26.234567901234566,
          "Rafael" => 24.897060231734173
        }
      }

      assert response == expected_response
  end
  test "when all invalid params , returns the an error", %{conn: conn} do
    params = %{"filename" => "a.csv"}

     response =
       conn
       |> get(Routes.imc_path(conn, :index, params))
       |> json_response(:bad_request)

       expected_response =  %{"result" => "deu erro ai amigao"}

       assert response == expected_response
   end
  end
end
