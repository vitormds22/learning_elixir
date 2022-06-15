defprotocol Describe do
  @fallback_to_any true
  def describe(struct)
end

defimpl Describe, for: [Human, Child] do
  def describe(human),
    do: "This is a human. Name: #{human.name}, Age: #{human.age}, Sex: #{human.sex}"
end

defimpl Describe, for: Pet do
  def describe(pet),
    do: "This is a pet. Name: #{pet.name}, Age: #{pet.age}, Animal: #{pet.animal}"
end

defimpl Describe, for: Any do
  def describe(_any),
    do: {:error, "Not supported"}
end
