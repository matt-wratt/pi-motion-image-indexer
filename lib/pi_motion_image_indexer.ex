defmodule PiMotionImageIndexer do

  def list_images(path) do
    ImageReader.list_images(path)
  end

end
