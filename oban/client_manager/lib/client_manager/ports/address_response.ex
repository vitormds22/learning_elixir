defmodule ClientManager.Ports.AddressResponse do
  @type t :: %__MODULE__{
          bairro: String.t(),
          cep: String.t(),
          localidade: String.t(),
          logradouro: String.t(),
          complemento: String.t() | nil,
          uf: String.t()
        }

  defstruct [:bairro, :cep, :localidade, :logradouro, :complemento, :uf]
end
