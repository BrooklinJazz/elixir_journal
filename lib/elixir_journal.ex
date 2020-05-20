defmodule Journal do
  @moduledoc """
  Documentation for `Journal`.
  """

  def write(path, content) do
    File.mkdir_p!(Path.dirname(path))
    File.write(path, content)
  end

  def save_entry(name, content) do
    write("entries/#{name}.md", content)
  end

  def draft(name \\ "entry", content \\ "") do
    String.split(name) |> Enum.join("_") |> prepend_time |> save_entry(content)
  end

  def prepend_time(name) do
    time = DateTime.utc_now()
    timestamp = "#{time.year}_#{time.month}_#{time.day}_#{time.hour}:#{time.minute}"
    timestamp <> "_" <> name
  end

  def addZero(min) when min >= 10 do
    min
  end

  def addZero(min) do
    "#{min}0"
  end
end
