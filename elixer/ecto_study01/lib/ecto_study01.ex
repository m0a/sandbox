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


defmodule EctoStudy01.User do
  use Ecto.Schema
  import Ecto.Schema
  import Ecto.Changeset
  
  schema "users" do
    field :username, :string
    field :encrypted_password, :string
    field :email, :string
    field :confirmed, :boolean, default: false
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps
  end
  
  @required_fields ~w(username encrypted_password email)
  @optional_fields ~w()

  def changeset(user, params \\ :empty) do
    user
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:password, min: 8)
    |> validate_password_confirmation
    |> unique_constraint(:username, name: :email)
    |> put_change(:encrypted_password, Comeonin.Bcrypt.hashpwsalt(params[:password]))
  end
  
  defp validate_password_confirmation(changeset) do
    case Ecto.Changeset.get_change(changeset, :password_confirmation) do
      nil -> password_mismatch_error(changeset)
      confirmation ->
        password = Ecto.Changeset.get_field(changeset, :password)
        if confirmation == password, do: changeset, else: password_incorrect_error(changeset)
    end
  end
  
  defp password_mismatch_error(changeset) do
    add_error(changeset, :password_confirmation, "Passwords does not match")
  end

  defp password_incorrect_error(changeset) do
    add_error(changeset, :password, "is not valid")
  end
  
end
