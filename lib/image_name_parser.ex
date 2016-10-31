defmodule ImageNameParser do

  def parse(image_path) do
    image_name = name_from_image_path(image_path)
    meta = chunks(image_name)
    %{
      path: image_path,
      name: image_name,
      event: event(meta),
      date: date(meta),
      time: time(meta),
      frame: frame(meta)
    }
  end

  defp name_from_image_path(image_path) do
    image_path
      |> String.split("/")
      |> List.last
  end

  defp event(meta) do
    {event, _} = Integer.parse(meta["event"])
    event
  end

  defp date(meta) do
    [meta["year"], meta["month"], meta["day"]]
      |> Enum.join("-")
  end

  defp time(meta) do
    [meta["hours"], meta["minutes"], meta["seconds"]]
      |> Enum.join(":")
  end

  defp frame(meta) do
    {frame, _} = Integer.parse(meta["frame"])
    frame
  end

  defp chunks(image_name) do
    regex = ~r/(?<event>\d+)-(?<year>\d{4})(?<month>\d{2})(?<day>\d{2})(?<hours>\d{2})(?<minutes>\d{2})(?<seconds>\d{2})-(?<frame>\d{2})/
    Regex.named_captures(regex, image_name)
  end
end
