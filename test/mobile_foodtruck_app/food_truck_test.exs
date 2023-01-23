defmodule MobileFoodtruckApp.FoodTruckTest do
  use MobileFoodtruckApp.DataCase

  alias MobileFoodtruckApp.FoodTruck

  describe "locations" do
    alias MobileFoodtruckApp.FoodTruck.Locations

    import MobileFoodtruckApp.FoodTruckFixtures

    @invalid_attrs %{}

    test "list_locations/0 returns all locations" do
      locations = locations_fixture()
      assert FoodTruck.list_locations() == [locations]
    end

    test "get_locations!/1 returns the locations with given id" do
      locations = locations_fixture()
      assert FoodTruck.get_locations!(locations.id) == locations
    end

    test "create_locations/1 with valid data creates a locations" do
      valid_attrs = %{}

      assert {:ok, %Locations{} = locations} = FoodTruck.create_locations(valid_attrs)
    end

    test "create_locations/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = FoodTruck.create_locations(@invalid_attrs)
    end

    test "update_locations/2 with valid data updates the locations" do
      locations = locations_fixture()
      update_attrs = %{}

      assert {:ok, %Locations{} = locations} = FoodTruck.update_locations(locations, update_attrs)
    end

    test "update_locations/2 with invalid data returns error changeset" do
      locations = locations_fixture()
      assert {:error, %Ecto.Changeset{}} = FoodTruck.update_locations(locations, @invalid_attrs)
      assert locations == FoodTruck.get_locations!(locations.id)
    end

    test "delete_locations/1 deletes the locations" do
      locations = locations_fixture()
      assert {:ok, %Locations{}} = FoodTruck.delete_locations(locations)
      assert_raise Ecto.NoResultsError, fn -> FoodTruck.get_locations!(locations.id) end
    end

    test "change_locations/1 returns a locations changeset" do
      locations = locations_fixture()
      assert %Ecto.Changeset{} = FoodTruck.change_locations(locations)
    end
  end
end
