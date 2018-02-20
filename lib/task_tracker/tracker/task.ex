defmodule TaskTracker.Tracker.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias TaskTracker.Tracker.Task

  schema "tasks" do
    field :body, :string
    field :completed, :boolean, default: false
    field :time, :integer
    field :title, :string
    belongs_to :user, TaskTracker.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    valid_times = 0..96
    valid_times = for n <- valid_times, do: n*15
    task
    |> cast(attrs, [:title, :body, :time, :completed, :user_id])
    |> validate_required([:title, :body, :time, :completed, :user_id])
    |> validate_inclusion(:time, valid_times)
  end
end
