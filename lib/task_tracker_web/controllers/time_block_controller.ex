defmodule TaskTrackerWeb.Time_blockController do
  use TaskTrackerWeb, :controller

  alias TaskTracker.Tracker
  alias TaskTracker.Tracker.Time_block

  action_fallback TaskTrackerWeb.FallbackController

  def index(conn, _params) do
    timeblocks = Tracker.list_timeblocks()
    render(conn, "index.json", timeblocks: timeblocks)
  end

  def create(conn, %{"time_block" => time_block_params}) do
    with {:ok, %Time_block{} = time_block} <- Tracker.create_time_block(time_block_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", time_block_path(conn, :show, time_block))
      |> render("show.json", time_block: time_block)
    end
  end

  def show(conn, %{"id" => id}) do
    time_block = Tracker.get_time_block!(id)
    render(conn, "show.json", time_block: time_block)
  end

  def update(conn, %{"id" => id, "time_block" => time_block_params}) do
    time_block = Tracker.get_time_block!(id)

    with {:ok, %Time_block{} = time_block} <- Tracker.update_time_block(time_block, time_block_params) do
      render(conn, "show.json", time_block: time_block)
    end
  end

  def delete(conn, %{"id" => id}) do
    time_block = Tracker.get_time_block!(id)
    with {:ok, %Time_block{}} <- Tracker.delete_time_block(time_block) do
      send_resp(conn, :no_content, "")
    end
  end
end
