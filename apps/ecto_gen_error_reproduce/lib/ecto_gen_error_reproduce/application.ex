defmodule EctoGenErrorReproduce.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      EctoGenErrorReproduce.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: EctoGenErrorReproduce.PubSub}
      # Start a worker by calling: EctoGenErrorReproduce.Worker.start_link(arg)
      # {EctoGenErrorReproduce.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: EctoGenErrorReproduce.Supervisor)
  end
end
