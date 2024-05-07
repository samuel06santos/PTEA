defmodule AuthWeb.SearchLive do
  use AuthWeb, :live_view
  alias Auth.Accounts


  def mount(_params, _session, socket) do
    limite = 10

    {
      :ok,
      assign(socket,
        search_text: "",
        users: Accounts.get_users(limite), #Accounts.get_random_users(limite)
        has_more_users: true,
        professions: ["Psicólogo(a)", "Fisioterapeuta", "Médico(a)", "Pedagogo(a)", "Fonoaudiólogo(a)", "Terapeuta Ocupacional", "Psicopedagogo(a)", "Psicólogo(a)", "Psiquiatra", "Pediatra", "Assistente social", "Enfermeiro(a)", "Farmacêutico(a)", "Professor(a)"]
      )
    }
  end

  def handle_event("search-submit", %{"q" => search_text}, socket) do
    {:noreply,
      assign(socket,
        search_text: search_text,
        users: Accounts.procura(search_text)
      )
    }
  end

  def handle_event("filter-profession", %{"profession" => profession}, socket) do
    filtered_users = Accounts.procura_por_profissao(profession)
    {:noreply, assign(socket, users: filtered_users, search_text: profession)}
  end

  def handle_event("load-more", _params, socket) do
    limite = 10
    last_user_id = socket.assigns.users |> List.last |> Map.get(:id)
    more_users = Accounts.load_more_users(last_user_id, limite)

    new_users = socket.assigns.users ++ more_users
    has_more_users = length(more_users) == limite
    {:noreply, assign(socket, users: new_users, has_more_users: has_more_users)}
  end


# Procura "automaticamente"
  # In form: <!-- phx-change="search-change" -->
#  def handle_event("search-change", %{"q" => search_text}, socket) do
#    {:noreply,
#      assign(socket,
#        search_text: search_text,
##        users: Auth.Accounts.procura(search_text)
#      )
#    }
#  end

end
