defmodule PiMotionImageIndexer do

  def index_images(path) do
    pid = ImageIndexer.start_link
    ImageReader.list_images(path)
      |> Enum.map(&ImageIndexer.index(pid, &1))
    pid
  end

  def parse_images(path) do
    list_images(path)
      |> Enum.map(&ImageNameParser.parse/1)
  end

  def list_images(path) do
    ImageReader.list_images(path)
  end

end
