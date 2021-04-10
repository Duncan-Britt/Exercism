defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    map = %{?G => ?C, ?C => ?G, ?T => ?A, ?A => ?U}
    Enum.map(dna, fn chr -> map[chr] end)
  end
end
