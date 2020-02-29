defmodule Word.Server do
  use GenServer

  def start_link(word_name) do
    GenServer.start_link(__MODULE__, [], name: via(word_name))
  end

  def add_word(word_name) do
    GenServer.cast(via(word_name), {:add_word, word_name})
  end

  def update_word_list(word_name) do
    GenServer.cast(via(word_name), {:update_word_list, word_name})
  end

  def via(word_name) do
    {:via, :gproc, {:n, :l, {:word, word_name}}}
  end

  @impl true
  def init(words) do
    {:ok, words}
  end

  @impl true
  def handle_cast({:add_word, new_word}, word ) do

  end
end
