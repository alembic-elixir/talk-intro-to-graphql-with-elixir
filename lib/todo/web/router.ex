defmodule Todo.Web.Router do
  use Todo.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug Plug.Parsers,
      parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
      json_decoder: Poison
  end

  scope "/", Todo.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/graphql" do
    pipe_through :api

    forward "/", Absinthe.Plug,
      schema: Todo.GraphQL.Schema
  end

  scope "/graphiql" do
    pipe_through :api

    forward "/", Absinthe.Plug.GraphiQL,
      schema: Todo.GraphQL.Schema
  end
end
