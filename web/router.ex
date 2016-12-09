defmodule CoherenceAjaxTest.Router do
  use CoherenceAjaxTest.Web, :router
  use Coherence.Router         # Add this

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session  # Add this
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
    plug Coherence.Authentication.Session, protected: true
  end

  # Add this block
  scope "/" do
    pipe_through :browser
    coherence_routes
  end

  # Add this block
  scope "/" do
    pipe_through :protected
    coherence_routes :protected
  end

  scope "/", CoherenceAjaxTest do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/", CoherenceAjaxTest do
    pipe_through :protected

    # add protected resources below
    get "/private", PrivateController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", CoherenceAjaxTest do
    pipe_through :api

    get "/ajax_stuff", AjaxController, :index
  end
end
