defmodule Wabanex.UserTest do
use Wabanex.DataCase, async: true

alias Wabanex.User

describe "changeset/1" do
test "when all params are valid, returns a valid changeset" do
  params = %{name: "Rafael,", email: "renan@sko", password: "123456789"}

  response = User.changeset(params)

  assert %Ecto.Changeset{
  valid?: true,
  changes: %{email: "renan@sko", name: "Rafael,", password: "123456789"},
  errors: []
} = response

end

test "when are invalid paramsd, returns a invalid changeset" do
  params = %{name: "Rafael,", email: "renansko", password: ""}

  response = User.changeset(params)

  expected_response = %{email: ["has invalid format"], password: ["can't be blank"]}

  assert errors_on(response) == expected_response

end

end

end
