defmodule WabanexWeb.Schema.Types.Exercises do
  use Absinthe.Schema.Notation

  @desc "Logic exercise represetation"

  object :exercise do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :youtube_video_url, non_null(:string)
    field :protocol_description, non_null(:string)
    field :repetitions, non_null(:string)
  end
  input_object :create_exercise_input do
    field :name, non_null(:string), description: "Exercise name"
    field :youtube_video_url, non_null(:string), description: "Exercise youtube_video_url"
    field :protocol_description, non_null(:string), description: "Exercise protocol_description"
    field :repetitions, non_null(:string), description: "Exercise repetitions"
  end
end
