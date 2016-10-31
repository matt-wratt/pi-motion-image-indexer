defmodule ImageReader do

  def list_images(path) do
    File.ls!(path)
      |> Enum.filter_map(&is_image/1, &prepend_path(&1, path))
  end

  defp is_image(filename) do
    Regex.match?(~r/.jpg$/, filename)
  end

  defp prepend_path(filename, path) do
    Regex.replace(~r/\/+/, path <> filename, "/")
  end

end
