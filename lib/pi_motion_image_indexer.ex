defmodule PiMotionImageIndexer do

  def parse_images(path) do
    list_images(path)
      |> Enum.map(&ImageNameParser.parse/1)
  end

  defp list_images(path) do
    ImageReader.list_images(path)
  end

end
