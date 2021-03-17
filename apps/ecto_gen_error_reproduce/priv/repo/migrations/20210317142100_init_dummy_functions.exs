defmodule EctoGenErrorReproduce.Repo.Migrations.InitDummyFunctions do
  use Ecto.Migration

  def up do
    execute """
    create function public.get_current_date()
      returns date
      language sql
      immutable
    as
    $$
    select current_date;
    $$;
    """
  end

  def down do
    execute """
    drop function if exists public.get_current_date()
    """
  end
end
