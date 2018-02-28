defmodule TaskTrackerWeb.Router do
  use TaskTrackerWeb, :router
  import TaskTrackerWeb.Plug
  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :get_user
    plug :get_users
    plug :get_lackies
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TaskTrackerWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
    resources "/tasks", TaskController
    post "/session", SessionController, :create
    delete "/session", SessionController, :delete
    get "/tasklist", PageController, :tasklist
    get "/tasks/:id/assign", TaskController, :assign
    get "/tasks/:id/logwork", TaskController, :logwork
    get "/completed", PageController, :completed
    get "/lackies_tasks", PageController, :lackies_tasks
  end

  # Other scopes may use custom stacks.
  scope "/api", TaskTrackerWeb do
    pipe_through :api
    resources "/timeblocks", Time_blockController, except: [:new, :edit]
  end
end
