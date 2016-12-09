defmodule CoherenceAjaxTest.AjaxController do
  use CoherenceAjaxTest.Web, :controller

  def index(conn, _params) do
    render conn, "index.json"
  end
end
