defmodule ProcessSupervisor do
  use Supervisor

  alias Word.Server
  def start_link do
    Supervisor.start_link(__MODULE__, [], name: :supervisor)
  end

  def start_word_process(name) do
    Supervisor.start_child(:supervisor, [name])
  end

  def init(_) do
    children = [
      worker(Word.Server, [])
    ]

    supervise(children, strategy: :one_for_one)
  end
end
