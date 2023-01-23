defmodule MobileFoodtruckAppWeb.LocationsController do
  use MobileFoodtruckAppWeb, :controller

  alias MobileFoodtruckApp.FoodTruck
  alias MobileFoodtruckApp.FoodTruck.Locations

  def index(conn, _params) do
    locations = FoodTruck.list_locations()
    render(conn, "index.html", locations: locations)
  end

  def new(conn, _params) do
    changeset = FoodTruck.change_locations(%Locations{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"locations" => locations_params}) do
    case FoodTruck.create_locations(locations_params) do
      {:ok, locations} ->
        conn
        |> put_flash(:info, "Locations created successfully.")
        |> redirect(to: Routes.locations_path(conn, :show, locations))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    location = FoodTruck.get_locations!(id)
    IO.inspect location
    render(conn, "show.html", locations: location)
  end

  def edit(conn, %{"id" => id}) do
    locations = FoodTruck.get_locations!(id)
    changeset = FoodTruck.change_locations(locations)
    render(conn, "edit.html", locations: locations, changeset: changeset)
  end

  def update(conn, %{"id" => id, "locations" => locations_params}) do
    locations = FoodTruck.get_locations!(id)

    case FoodTruck.update_locations(locations, locations_params) do
      {:ok, locations} ->
        conn
        |> put_flash(:info, "Locations updated successfully.")
        |> redirect(to: Routes.locations_path(conn, :show, locations))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", locations: locations, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    locations = FoodTruck.get_locations!(id)
    {:ok, _locations} = FoodTruck.delete_locations(locations)

    conn
    |> put_flash(:info, "Locations deleted successfully.")
    |> redirect(to: Routes.locations_path(conn, :index))
  end
end
