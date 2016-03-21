defmodule Quafe.API do
  @user_agent [{"User-agent", "Quafe 0.1 - github.com/hreeder/quafe"}]

  def call_api(endpoint, args \\ %{}) do
    "#{Application.get_env(:quafe, :api_host)}/#{endpoint}.xml.aspx"
    |> HTTPoison.post({:form, Enum.map(args, &(&1))}, @user_agent)
    #|> process_response
  end

  def process_response({:ok, response}) do
    doc = Exml.parse response.body
    Exml.get
  end
end
