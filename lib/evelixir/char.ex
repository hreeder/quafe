defmodule EVElixir.Char do
  alias Edenex.XML
  def character_id_from_name(name) do
    [first | _ ] = XML.make_call "eve/CharacterID", %{'names': name}
    {charID, _ } = Integer.parse to_string first.characterID
    charID
  end
end
