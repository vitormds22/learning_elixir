alias User

defprotocol Size do
  @doc """
  Calculates the size of a data structure
  """
  @fallback_to_any true
  def size(data)
end

defimpl Size, for: BitString do
  def size(string), do: byte_size(string)
end

defimpl Size, for: Map do
  def size(map), do: map_size(map)
end

defimpl Size, for: Tuple do
  def size(tuple), do: tuple_size(tuple)
end

defimpl Size, for: MapSet do
  def size(map_set), do: MapSet.size(map_set)
end

defimpl Size, for: User do
  def size(_user), do: 2
end

defimpl Size, for: Any do
  def size(_), do: false
end
