defmodule WabanexWeb.SchemaTest do
use WabanexWeb.ConnCase, async: true

alias Wabanex.User
alias Wabanex.Users.Create

describe "users query" do
  test "When a valid id is given, returns the user", %{conn: conn} do
    params = %{email: "renan@Ssko", name: "Renan", password: "123456"}

    {:ok, %User{id: user_id}} = Create.call(params)

    query = """
      {
        getUser(id: "#{user_id}"){
          name
          id
          email
        }
    }
    """


    response =
      conn
      |> post("/api/graphql", %{query: query})
      |> json_response(:ok)


      assert %{
        "data" => %{
          "getUser" => %{
            "email" => "renan@Ssko",
            "id" => _id,
            "name" => "Renan"
          }
        }
      } = response
end
test "When are invalid id is given, returns an user", %{conn: conn} do
  params = %{email: "renan@Ssko", name: "Renan", password: "123456"}

  {:ok, %User{id: user_id}} = Create.call(params)

  query = """
    {
      getUser(id: "banana"){
        name
        email
      }
  }
  """


  response =
    conn
    |> post("/api/graphql", %{query: query})
    |> json_response(:ok)

    expected_response =  %{"errors" => [%{"locations" => [%{"column" => 13, "line" => 2}], "message" => "Argument \"id\" has invalid value \"banana\"."}]}

    assert response == expected_response
end
end
describe "user mutations" do
  test "when all params are valid, create the user", %{conn: conn} do

  mutation = """
    mutation {
      createUser(input:{
        name: "renan",
        email: "renan@sko",
        password: "123456"
      }){
        id
        name
      }

    }
  """

  response =
    conn
    |> post("/api/graphql", %{query: mutation})
    |> json_response(:ok)


    assert %{"data" => %{"createUser" => %{"id" => _id, "name" => "renan"}}} = response
  end
end
end
