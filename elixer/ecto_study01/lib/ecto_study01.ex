defmodule EctoStudy01.App do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(EctoStudy01.Repo, [])
    ]

    opts = [strategy: :one_for_one, name: EctoStudy01.Supervisor]
    Supervisor.start_link(children, opts)
  end
end


defmodule EctoStudy01.Repo do
  use Ecto.Repo, otp_app: :ecto_study01
end

defmodule EctoStudy01.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string, unique: true
      add :encrypted_password, :string, null: false
      add :email, :string
      add :confirmed, :boolean, default: false

      timestamps
    end

    create unique_index(:users, [:username], name: :unique_usernames)
  end
end