defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, nucleotide) do
    check(strand, nucleotide)
  end

  defp check('', _), do: 0
  defp check(strand, nucleotide) do
    value = strand
    |> Enum.reduce(%{}, fn char, acc ->
         Map.put(acc, char, (acc[char] || 0) + 1)
       end)

    result = if Map.has_key?(value, nucleotide) do
      %{^nucleotide => count} = value
      count
    else
      0
    end
    result
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram(charlist()) :: map()
  def histogram(strand) do
    a_value = count(strand, ?A)
    t_value = count(strand, ?T)
    c_value = count(strand, ?C)
    g_value = count(strand, ?G)
    %{
      ?A => a_value,
      ?T => t_value,
      ?C => c_value,
      ?G => g_value
    }
  end
end

# expected = %{?A => 0, ?T => 0, ?C => 0, ?G => 8}
# IO.inspect NucleotideCount.histogram('GGGGGGGG') == expected
# IO.inspect NucleotideCount.count('CCCCCCCCC', ?C) == 9
# IO.inspect NucleotideCount.count('CC', ?A) == 0
