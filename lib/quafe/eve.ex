defmodule Quafe.EVE do
  alias Quafe.API
  def character_ids_from_names(names) do
    API.get("eve/CharacterID", %{'names': Enum.join(names, ",")})
    |> Enum.map(&(%{:characterID => elem(Integer.parse(to_string(&1.characterID)),0),
                    :name => to_string(&1.name)}))
  end

  def character_id_from_name(inputName) do
    [first | _ ] = character_ids_from_names [inputName]
    first
  end
end
