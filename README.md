# Quafe

Quafe is an Elixir library to provide access to the EVE Online XML API. The aim is to have a native-like experience of accessing the API.

## Usage
```elixir
iex(1)> Quafe.Server.server_status
%{onlinePlayers: "17358", serverOpen: true}
```

## Installation
### Current
Until Quafe gets published in Hex, you can add Quafe to your list of dependencies in `mix.exs` as so:
```elixir
def deps do
    [{:quafe, github: "hreeder/quafe"}]
end
```
### Future: Hex
If [available in Hex](https://hex.pm/docs/publish), the package can be installed in your list of dependencies in `mix.exs` as so:
```elixir
def deps do
    [{:quafe, "~> 0.0.1"}]
end
```
