defmodule TaskTrackerWeb.PageController do
  use TaskTrackerWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def tasklist(conn, _params) do
    tasks = TaskTracker.Tracker.list_tasks()
    changeset = TaskTracker.Tracker.change_task(%TaskTracker.Tracker.Task{})
    render conn, "tasklist.html", tasklist: tasks, changeset: changeset
  end

  def completed(conn, _params) do
    tasks = TaskTracker.Tracker.list_tasks()
    changeset = TaskTracker.Tracker.change_task(%TaskTracker.Tracker.Task{})
    render conn, "completed.html", tasklist: tasks, changeset: changeset
  end
end
