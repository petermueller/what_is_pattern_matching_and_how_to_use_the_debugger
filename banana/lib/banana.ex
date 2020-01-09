require IEx

defmodule Banana do
  @moduledoc """
  This is just a simple module to peel bananas.

  To use:

  iex> a_banana = struct(Banana) # Makes a `Banana` struct (a Map with special rules), with a default of 5 sides
  %Banana{sides: 5}

  iex> Banana.peel(a_banana) # Should `IO.puts` as it peels the banana, then return `:yum`
  :yum
  """

  defstruct sides: 5


  @doc """
  Should peel the banana, `IO.puts`ing as it goes, and stop when it's peeled, returning `:yum`

  There's a bug though.

  Run the command `iex -S mix` in your terminal to bring up Interactive Elixir,
    then run the example below, and you should see the bug.


  Example:
  iex> struct(Banana) |> Banana.peel()
  :yum

  Try putting an `IEx.pry()` somewhere in the `peel` definitions below,
    then run `r Banana` in your iex shell to recompile the `Banana` module with your changes.

  Now when you call `Banana.peel/1` like in the example above it should stop,
    and you'll have access to the variables at that breakpoint.

  You can also run `IEx.break!(Banana, :peel, 1, 10)`.
    This sets a breakpoint any time `Banana.peel/1` is called
    and will stop up to 10 times before you have to re-enable it again.

  See if you can determine what you need to change to fix the bug,
    using the IEx functions available to you to confirm your hypotheses.


  If you would like a hint to get you started, run `iex -S mix` to get the `iex` shell, then copy the line below (without the `backticks`) then hit enter:
  `Base.decode64("UGF0dGVybiBNYXRjaGluZyBpcyBhbHdheXMgZXZhbHVhdGVkICd0b3AtZG93bicgKGUuZy4gY2FzZS9jb25kKSwgZXZlbiBgZGVmYCBjYWxscy4=")`

  If you want to know (one of) the solution(s), run this in your `iex` shell:
  `Base.decode64("VGhlIGZpcnN0IGRlZmluaXRpb24gb2YgYHBlZWwvMWAgaXMgYWx3YXlzIG1hdGNoaW5nLCBzbyB0aGUgc2Vjb25kIGRlZmluaXRpb24gKGBkZWYgcGVlbCglQmFuYW5he3NpZGVzOiAwfSlgKSBuZXZlciBtYXRjaGVzLiBXaGVuIG1hdGNoaW5nIHRoaW5ncywgdGhlICdwYXR0ZXJucycgYXJlIGV2YWx1YXRlZCBpbiB0aGUgb3JkZXIgdGhleSBhcmUgZGVmaW5lZC4gVGhlIHNlY29uZCBkZWZpbml0aW9uIHNob3VsZCBiZSBtb3ZlZCBhYm92ZSB0aGUgZmlyc3QsIHNpbmNlIGBzaWRlczogc2lkZXNgIGlzIHRvbyBnZW5lcmljLCBhbmQgc2hvdWxkIG9ubHkgYmUgY2hlY2tlZCBpZiBgc2lkZXM6IDBgIGRvZXNuJ3QgbWF0Y2gu")`
  """
  def peel(%Banana{sides: sides} = banana) do
    remaining_sides = sides - 1
    IO.puts("peeling the banana, #{remaining_sides} left")

    peel(%{banana | sides: remaining_sides})
  end

  def peel(%Banana{sides: 0}) do
    IO.put("TIME TO EAT THE BANANA!!!")

    :yum
  end
end
