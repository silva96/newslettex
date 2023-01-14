defmodule NewslettexWeb.BulmaHelpers do
  @moduledoc """
  Conveniences for translating and building error messages.
  """

  use Phoenix.HTML
  alias NewslettexWeb.Router.Helpers, as: Routes

  @doc """
  Generates tag for inlined form input errors.
  """
  def error_tag(form, field) do
    Enum.map(Keyword.get_values(form.errors, field), fn error ->
      content_tag(:p, translate_error(error), class: "help is-danger")
    end)
  end

  def bulma_text_input(form, attrs) do
    text_input(form, attrs.field_name, class: "input", placeholder: Map.get(attrs, :placeholder))
  end

  def bulma_select_input(form, attrs) do
    [
      content_tag(:div, class: "select") do
        select(form, attrs.field_name, attrs.options)
      end,
      if Map.get(attrs, :placeholder) do
        content_tag(:p, class: "help") do
          Map.get(attrs, :placeholder)
        end
      end
    ]
  end

  def bulma_text_area(form, attrs) do
    textarea(form, attrs.field_name, class: "textarea")
  end

  def bulma_submit_or_back(model, conn) do
    content_tag(:div, class: "field is-grouped") do
      [
        content_tag(:div, class: "control") do
          submit("Save", class: "button is-primary")
        end,
        content_tag(:div, class: "control") do
          link("Back",
            to: apply(Routes, :"#{model}_path", [conn, :index]),
            class: "button is-text"
          )
        end
      ]
    end
  end

  def bulma_input(type_of_input, form, attrs) do
    content_tag(:div, class: "field") do
      [
        label(form, attrs.field_name, class: "label"),
        content_tag(:div, class: "control") do
          apply(__MODULE__, :"bulma_#{type_of_input}", [form, attrs])
        end,
        error_tag(form, attrs.field_name)
      ]
    end
  end

  @doc """
  Translates an error message using gettext.
  """
  def translate_error({msg, opts}) do
    # When using gettext, we typically pass the strings we want
    # to translate as a static argument:
    #
    #     # Translate "is invalid" in the "errors" domain
    #     dgettext("errors", "is invalid")
    #
    #     # Translate the number of files with plural rules
    #     dngettext("errors", "1 file", "%{count} files", count)
    #
    # Because the error messages we show in our forms and APIs
    # are defined inside Ecto, we need to translate them dynamically.
    # This requires us to call the Gettext module passing our gettext
    # backend as first argument.
    #
    # Note we use the "errors" domain, which means translations
    # should be written to the errors.po file. The :count option is
    # set by Ecto and indicates we should also apply plural rules.
    if count = opts[:count] do
      Gettext.dngettext(NewslettexWeb.Gettext, "errors", msg, msg, count, opts)
    else
      Gettext.dgettext(NewslettexWeb.Gettext, "errors", msg, opts)
    end
  end
end
