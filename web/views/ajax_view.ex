defmodule CoherenceAjaxTest.AjaxView do
  use CoherenceAjaxTest.Web, :view

  def render("index.json", _) do
    %{things: [1, 2, 3, 4, 5]}
  end
end
