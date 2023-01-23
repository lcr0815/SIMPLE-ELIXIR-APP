defmodule MobileFoodtruckApp.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :locationid, :integer
      add :applicant, :string
      add :facility_type, :string
      add :cnn, :integer
      add :location_description, :string
      add :address, :string
      add :blocklot, :string
      add :block, :string
      add :lot, :string
      add :permit, :string
      add :status, :string
      add :food_items, :text
      add :x, :float
      add :y, :float
      add :latitude, :float
      add :longitude, :float
      add :schedule, :string
      add :dayshours, :string
      add :noisent, :string
      add :approved, :string
      add :received, :string
      add :prior_permit, :string
      add :expiration_date, :string
      add :location, :string
      add :fire_prevention_districts, :integer
      add :police_districts, :integer
      add :supervisor_districts, :integer
      add :zip_codes, :integer
      add :neighborhoods_old, :integer
      timestamps()
    end
  end
end
