defmodule AuthWeb.PostLive do
  use Phoenix.LiveComponent
  use Timex

  def update(assigns, session, socket) do
    current_user = Auth.Accounts.get_user_by_session_token(session["user_token"])
    {:ok,
      assign(
        socket,
        assigns,
        current_user: current_user
      )
    }
  end

  # <%= live_component AuthWeb.PostLive, post: post, current_user: @current_user %>
  # <%= live_component @socket, AuthWeb.PostLive, id: "post-#{post.id}", post: post, current_user: @current_user %>

  @doc """
  Converte uma data e hora para uma string formatada.

  ## Parâmetros

    - date: A data a ser formatada.
    - time: A hora a ser formatada.

  ## Exemplos

      iex> format_datetime(~D[2024-01-19], ~T[15:30:00])
      "19 de jan de 2024 • 15:30"
  """
  def format_datetime(date, time) do
    {date, time} = {to_string(date), to_string(time)}

    "#{String.slice(date, 8, 2)} de #{to_name_of_month(date)} de #{String.slice(date, 0, 4)} • #{format_time(time)}"
  end

  @doc false
  defp format_time(time) do
    String.slice(to_string(time), 0..4)
  end

  @doc false
  defp to_name_of_month(date) do
    month = String.slice(to_string(date), 5, 2)
    case month do
      "01" -> "jan"
      "02" -> "fev"
      "03" -> "mar"
      "04" -> "abr"
      "05" -> "mai"
      "06" -> "jun"
      "07" -> "jul"
      "08" -> "ago"
      "09" -> "set"
      "10" -> "out"
      "11" -> "nov"
      "12" -> "dez"
    end
  end

  @doc """
  Calcula o tempo decorrido desde uma postagem com base na data e hora fornecidas.

  ## Parâmetros

    - date: A data da postagem.
    - time: A hora da postagem.

  ## Retorna

    Retorna uma string representando o tempo decorrido desde a postagem, em minutos, horas ou dias.

  ## Exemplos

      iex> DateTime.now("America/Sao_Paulo")
      #DateTime<2024-01-24 14:22:09-03:00 -03 America/Sao_Paulo>

      iex> hours_since_posted(~D[2024-01-24], ~T[13:22:09])
      "1 h"
  """
  def hours_since_posted(date, time) do
    datetime_str = "#{to_string(date)} #{to_string(time)}"
    datetime_posted =
      datetime_str
        |> Timex.parse!("%Y-%m-%d %H:%M:%S", :strftime)
        |> Timex.to_datetime("America/Sao_Paulo")

    current_datetime = Timex.local()

    diff = Timex.diff(current_datetime, datetime_posted, :hours)

    cond do
      diff < 1 ->
        "#{Timex.diff(current_datetime, datetime_posted, :minutes)} min"
      diff >= 24 ->
        "#{Timex.diff(current_datetime, datetime_posted, :days)} d"
      true ->
        "#{diff} h"
    end
  end


end
