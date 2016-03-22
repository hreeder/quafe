defmodule Quafe.Server do
    alias Quafe.API
    def server_status do
        {:ok, response} = API.fetch_from_CCP "server/ServerStatus"
        doc = Exml.parse response.body
        open = false
        case Exml.get(doc, "//serverOpen") do
            "True" ->
                open = true
            _ ->
                open = false
        end
        %{:onlinePlayers => Exml.get(doc, "//onlinePlayers"),
          :serverOpen => open}
    end
end