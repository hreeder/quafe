defmodule Quafe.API do
  alias Edenex.XML
  @user_agent [{"User-agent", "Quafe 0.1 (https://github.com/hreeder/quafe)"}]

  def key(id, vcode) do
    %{:keyID => id, :vCode => vcode}
  end

  def get_authenticated(api_key, endpoint, args \\ %{}) do
    api_key
    |> fetch_from_CCP_with_key(endpoint, args)
    |> XML.process_response
  end

  def get(endpoint, args \\ %{}) do
    endpoint
    |> fetch_from_CCP(args)
    |> XML.process_response
  end

  def fetch_from_CCP_with_key(api_key, endpoint, args \\ %{}) do
    endpoint
    |> fetch_from_CCP(Dict.merge(args, api_key))
  end

  def fetch_from_CCP(endpoint, args \\ %{}) do
    "#{Application.get_env(:quafe, :api_host)}/#{endpoint}.xml.aspx"
    |> HTTPoison.post({:form, Enum.map(args, &(&1))}, @user_agent)
  end

  def process_response({:ok, response}) do
    # Here we will process the response somehow...
  end
end
