defmodule ElixirJournalTest do
  use ExUnit.Case
  doctest ElixirJournal

  test "greets the world" do
    assert ElixirJournal.hello() == :world
  end
end
