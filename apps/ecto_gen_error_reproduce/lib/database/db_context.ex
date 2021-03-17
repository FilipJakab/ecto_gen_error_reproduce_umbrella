# This code has been auto-generated
# Changes to this file will be lost on next generation

defmodule EctoGenErrorReproduce.Database.DbContext do
  @moduledoc """
  This module contains functions for calling DB's stored procedures.
  Functions of this module uses `query/2` function of Repo that you have provided (`db_config` key of configuration)
  """

  require Logger

  import Elixir.EctoGenErrorReproduce.Repo, only: [query: 2]

  @spec get_current_date() :: {:error, any()} | {:ok, [Date.t()]}
  def get_current_date() do
    Logger.debug("Calling stored procedure", procedure: "get_current_date")

    query(
      "select * from public.get_current_date()",
      []
    )
    |> EctoGenErrorReproduce.Database.Parsers.GetCurrentDateParser.parse_get_current_date_result()
  end
end