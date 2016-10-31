defmodule ImageIndexer do
  use GenServer

  # Public API

  def start_link do
    GenServer.start_link(__MODULE__, [], [])
  end

  def index(pid, image_name) do
    GenServer.call(pid, {:index, image_name})
  end

  def list_all(pid) do
    GenServer.call(pid, :list_all)
  end

  # Private API

  def init(index) do
    {:ok, index}
  end

  def handle_call({:index, image_name}, _from, index) do
    meta = ImageNameParser.parse(image_name)
    {:reply, {:ok, meta}, [meta | index]}
  end

  def handle_call(:list_all, _from, index) do
    {:reply, {:ok, index}, index}
  end

end
