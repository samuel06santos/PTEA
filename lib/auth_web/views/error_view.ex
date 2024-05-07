defmodule AuthWeb.ErrorView do
  use AuthWeb, :view

  # If you want to customize a particular status code
  # for a certain format, you may uncomment below.
  def render("404.html", _assigns) do
    render("404_page.html", page_title: "404 - Página não encontrada")
  end

  def render("500.html", _assigns) do
#     "Internal Server Error"
    render("500_page.html", page_title: "500 - Erro interno do servidor")
  end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.html" becomes
  # "Not Found".
  def template_not_found(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end




#  def render("404.html", assigns) do
#    IO.puts "deu View"
#    render_template("404_page.html", assigns)
#  end
#
#  def render("500.html", assigns) do
#    render_template("500_page.html", assigns)
#  end
#
#  defp render_template(template, assigns) do
#    Phoenix.View.render_to_iodata(AuthWeb.LayoutView, {YourAppWeb.LayoutView, "error.html"}, Map.put(assigns, :inner_content, Phoenix.View.render(AuthWeb.ErrorView, template, assigns)))
#  end
end