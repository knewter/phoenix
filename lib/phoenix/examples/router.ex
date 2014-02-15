defmodule Router do
  use Phoenix.Router, port: 4000

  scope alias: Phoenix.Examples.Controllers do
    get "pages/:page", Pages, :show, as: :page
    get "files/*path", Files, :show, as: :file
    get "profiles/user-:id", Users, :show

    resources "users", Users do
      resources "comments", Comments
    end
  end
end
