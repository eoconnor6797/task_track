# TaskTracker
  * Users can register and log to the task tracker
  * When a User is registering, they can select another user as their manager
    - this cannot change once it is set
  * Logged in users will see a link from the login page to the in progress tasks, completed tasks, 
  a form to make new tasks, a link to their profile and a link to their lackey's status
  * The users that are managed by another user are known as that user's "lackeys"
  * On a User's profile, they can see their manager as well as their lackeys
  * Users can assign tasks to anyone that they manage
  * If a user does not have a manager they cannot be assigned tasks
  * If a user has not lackeys they cannot assign tasks
  * Users can log work on tasked that are assigned to them and mark them as complete
  * Users can reassign tasks that are assigned to one of their lackeys
  * Users can no log work in real time on their tasks.
    - While on the 'details' page of a task, the assigned user can
      'begin work' and then 'end work' to make a duration of time worked
      on a task.
  * Completed tasks cannot be modified
  * Time durations cannot be edited

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
