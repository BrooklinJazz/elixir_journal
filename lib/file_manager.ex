defmodule Journal.FileManager do
  def new(name \\ "entry", content \\ "") do
    String.split(name)
    |> Enum.join("_")
    |> prepend_time
    |> save_entry(content)
  end

  defp write(path, content) do
    File.mkdir_p!(Path.dirname(path))
    File.write(path, content)
  end

  defp save_entry(name, content) do
    write("entries/#{name}.md", content)
  end

  defp prepend_time(name) do
    time = DateTime.utc_now()
    timestamp = "#{time.year}_#{time.month}_#{time.day}_#{time.hour}:#{addZero(time.minute)}"
    timestamp <> "_" <> name
  end

  defp addZero(min) when min >= 10 do
    min
  end

  defp addZero(min) do
    "#{min}0"
  end
end
