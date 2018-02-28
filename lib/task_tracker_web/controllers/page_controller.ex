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
   
  def lackies_tasks(conn, _params) do
    user_id = get_session(conn, :user_id)
    changeset = TaskTracker.Tracker.change_task(%TaskTracker.Tracker.Task{})
    lackys = TaskTracker.Accounts.get_lackies!(user_id)
    all_tasks = TaskTracker.Tracker.list_tasks()
    lacky_tasks = Enum.filter(all_tasks, fn task -> Enum.member?(lackys, task.user) end) 
    render conn, "lacky.html", tasklist: lacky_tasks, changeset: changeset
  end
end
