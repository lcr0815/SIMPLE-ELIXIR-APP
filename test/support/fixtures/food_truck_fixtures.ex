defmodule MobileFoodtruckApp.FoodTruckFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MobileFoodtruckApp.FoodTruck` context.
  """

  @doc """
  Generate a locations.
  """
  def locations_fixture(attrs \\ %{}) do
    {:ok, locations} =
      attrs
      |> Enum.into(%{

      })
      |> MobileFoodtruckApp.FoodTruck.create_locations()

    locations
  end
end
