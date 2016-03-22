defmodule Quafe.API do
  @user_agent [{"User-agent", "Quafe 0.1 (https://github.com/hreeder/quafe)"}]
  
  def fetch_from_CCP_with_key(api_key, endpoint, args \\ %{}) do
    
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
