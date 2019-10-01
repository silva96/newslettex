defmodule NewslettexWeb.LayoutView do
  use NewslettexWeb, :view

  def page_title(assigns) do
    if assigns[:page_title] do
      "#{assigns[:page_title]} - Newslettex"
    else
      "Newslettex"
    end
  end
end
