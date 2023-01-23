defmodule MobileFoodtruckApp.FoodTruck.Locations do
  use Ecto.Schema
  import Ecto.Changeset

  schema "locations" do
    field :locationid, :integer
    field :applicant, :string
    field :facility_type, :string
    field :cnn, :integer
    field :location_description, :string
    field :address, :string
    field :blocklot, :string
    field :block, :string
    field :lot, :string
    field :permit, :string
    field :status, :string
    field :food_items, :string
    field :x, :float
    field :y, :float
    field :latitude, :float
    field :longitude, :float
    field :schedule, :string
    field :dayshours, :string
    field :noisent, :string
    field :approved, :string
    field :received, :string
    field :prior_permit, :string
    field :expiration_date, :string
    field :location, :string
    field :fire_prevention_districts, :integer
    field :police_districts, :integer
    field :supervisor_districts, :integer
    field :zip_codes, :integer
    field :neighborhoods_old, :integer

    timestamps()
  end

  @doc false
  def changeset(locations, attrs) do
    locations
    |> cast(attrs, [])
    |> validate_required([])
  end
end
