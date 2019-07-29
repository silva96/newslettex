defmodule Newslettex.NewsletterTest do
  use Newslettex.DataCase

  alias Newslettex.Newsletter

  describe "lists" do
    alias Newslettex.Newsletter.List

    @valid_attrs %{name: "some name", status: :importing}
    @update_attrs %{name: "some updated name", status: :imported}
    @invalid_attrs %{name: nil, status: nil}

    def list_fixture(attrs \\ %{}) do
      {:ok, list} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Newsletter.create_list()

      list
    end

    test "list_lists/0 returns all lists" do
      list = list_fixture()
      assert Newsletter.list_lists() == [list]
    end

    test "get_list!/1 returns the list with given id" do
      list = list_fixture()
      assert Newsletter.get_list!(list.id) == list
    end

    test "create_list/1 with valid data creates a list" do
      assert {:ok, %List{} = list} = Newsletter.create_list(@valid_attrs)
      assert list.name == "some name"
      assert list.status == :importing
    end

    test "create_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Newsletter.create_list(@invalid_attrs)
    end

    test "update_list/2 with valid data updates the list" do
      list = list_fixture()
      assert {:ok, %List{} = list} = Newsletter.update_list(list, @update_attrs)
      assert list.name == "some updated name"
      assert list.status == :imported
    end

    test "update_list/2 with invalid data returns error changeset" do
      list = list_fixture()
      assert {:error, %Ecto.Changeset{}} = Newsletter.update_list(list, @invalid_attrs)
      assert list == Newsletter.get_list!(list.id)
    end

    test "delete_list/1 deletes the list" do
      list = list_fixture()
      assert {:ok, %List{}} = Newsletter.delete_list(list)
      assert_raise Ecto.NoResultsError, fn -> Newsletter.get_list!(list.id) end
    end

    test "change_list/1 returns a list changeset" do
      list = list_fixture()
      assert %Ecto.Changeset{} = Newsletter.change_list(list)
    end
  end
end
