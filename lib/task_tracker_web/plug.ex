defmodule TaskTrackerWeb.Plug do
  import Plug.Conn

  #Based off of lecture notes
  def get_user(conn, _params) do
    user_id = get_session(conn, :user_id)
    user = TaskTracker.Accounts.get_user(user_id || -1)
    assign(conn, :current_user, user)
  end

  def get_users(conn, _params) do
    users = TaskTracker.Accounts.list_users()
    assign(conn, :users, users)
  end

  def get_lackies(conn, _params) do
    user_id = get_session(conn, :user_id)
    lackies = TaskTracker.Accounts.get_lackies!(user_id || -1)
    assign(conn, :lackies, lackies)
  end
end
