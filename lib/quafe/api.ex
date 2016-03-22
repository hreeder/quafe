defmodule Quafe.API do
  @user_agent [{"User-agent", "Quafe 0.1 (https://github.com/hreeder/quafe)"}]

  def get_authenticated(api_key, endpoint, args \\ %{}) do
    api_key
    |> fetch_from_CCP_with_key(endpoint, args)
    |> process_response
  end

  def get(api_key, endpoint, args \\ %{}) do
    endpoint
    |> fetch_from_CCP(args)
    |> process_response
  end

  def fetch_from_CCP_with_key(api_key, endpoint, args \\ %{}) do
    endpoint
    |> fetch_from_CCP(Dict.merge(args, %{ keyID: api_key.keyid,
                                          vCode: api_key.vcode}))
  end

  def fetch_from_CCP(endpoint, args \\ %{}) do
    "#{Application.get_env(:quafe, :api_host)}/#{endpoint}.xml.aspx"
    |> HTTPoison.post({:form, Enum.map(args, &(&1))}, @user_agent)
  end

  def process_response({:ok, response}) do
    doc = Exml.parse response.body
    Exml.get
  end
end
