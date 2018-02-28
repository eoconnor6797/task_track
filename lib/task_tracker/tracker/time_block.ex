defmodule TaskTracker.Tracker.Time_block do
  use Ecto.Schema
  import Ecto.Changeset
  alias TaskTracker.Tracker.Time_block


  schema "timeblocks" do
    field :end_time, :utc_datetime
    field :start_time, :utc_datetime
    belongs_to :task, TaskTracker.Tracker.Task

    timestamps()
  end

  @doc false
  def changeset(%Time_block{} = time_block, attrs) do
    time_block
    |> cast(attrs, [:start_time, :end_time, :task_id])
    |> validate_required([:start_time, :end_time])
  end

end
