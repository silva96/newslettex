defmodule Newslettex.Newsletter do
  @moduledoc """
  The Newsletter context.
  """

  import Ecto.Query, warn: false
  alias Newslettex.Repo

  alias Newslettex.Newsletter.List

  @doc """
  Returns the list of lists.

  ## Examples

      iex> list_lists()
      [%List{}, ...]

  """
  def list_lists do
    Repo.all(List)
  end

  @doc """
  Gets a single list.

  Raises `Ecto.NoResultsError` if the List does not exist.

  ## Examples

      iex> get_list!(123)
      %List{}

      iex> get_list!(456)
      ** (Ecto.NoResultsError)

  """
  def get_list!(id), do: Repo.get!(List, id)

  @doc """
  Creates a list.

  ## Examples

      iex> create_list(%{field: value})
      {:ok, %List{}}

      iex> create_list(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_list(attrs \\ %{}) do
    %List{}
    |> List.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a list.

  ## Examples

      iex> update_list(list, %{field: new_value})
      {:ok, %List{}}

      iex> update_list(list, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_list(%List{} = list, attrs) do
    list
    |> List.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a List.

  ## Examples

      iex> delete_list(list)
      {:ok, %List{}}

      iex> delete_list(list)
      {:error, %Ecto.Changeset{}}

  """
  def delete_list(%List{} = list) do
    Repo.delete(list)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking list changes.

  ## Examples

      iex> change_list(list)
      %Ecto.Changeset{source: %List{}}

  """
  def change_list(%List{} = list) do
    List.changeset(list, %{})
  end

  alias Newslettex.Newsletter.CampaignGroup

  @doc """
  Returns the list of campaign_groups.

  ## Examples

      iex> list_campaign_groups()
      [%CampaignGroup{}, ...]

  """
  def list_campaign_groups do
    Repo.all(CampaignGroup)
  end

  @doc """
  Gets a single campaign_group.

  Raises `Ecto.NoResultsError` if the Campaign group does not exist.

  ## Examples

      iex> get_campaign_group!(123)
      %CampaignGroup{}

      iex> get_campaign_group!(456)
      ** (Ecto.NoResultsError)

  """
  def get_campaign_group!(id), do: Repo.get!(CampaignGroup, id)

  @doc """
  Creates a campaign_group.

  ## Examples

      iex> create_campaign_group(%{field: value})
      {:ok, %CampaignGroup{}}

      iex> create_campaign_group(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_campaign_group(attrs \\ %{}) do
    %CampaignGroup{}
    |> CampaignGroup.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a campaign_group.

  ## Examples

      iex> update_campaign_group(campaign_group, %{field: new_value})
      {:ok, %CampaignGroup{}}

      iex> update_campaign_group(campaign_group, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_campaign_group(%CampaignGroup{} = campaign_group, attrs) do
    campaign_group
    |> CampaignGroup.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a CampaignGroup.

  ## Examples

      iex> delete_campaign_group(campaign_group)
      {:ok, %CampaignGroup{}}

      iex> delete_campaign_group(campaign_group)
      {:error, %Ecto.Changeset{}}

  """
  def delete_campaign_group(%CampaignGroup{} = campaign_group) do
    Repo.delete(campaign_group)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking campaign_group changes.

  ## Examples

      iex> change_campaign_group(campaign_group)
      %Ecto.Changeset{source: %CampaignGroup{}}

  """
  def change_campaign_group(%CampaignGroup{} = campaign_group) do
    CampaignGroup.changeset(campaign_group, %{})
  end

  alias Newslettex.Newsletter.Campaign

  @doc """
  Returns the list of campaigns.

  ## Examples

      iex> list_campaigns()
      [%Campaign{}, ...]

  """
  def list_campaigns do
    Repo.all(Campaign)
  end

  @doc """
  Gets a single campaign.

  Raises `Ecto.NoResultsError` if the Campaign does not exist.

  ## Examples

      iex> get_campaign!(123)
      %Campaign{}

      iex> get_campaign!(456)
      ** (Ecto.NoResultsError)

  """
  def get_campaign!(id), do: Repo.get!(Campaign, id)

  @doc """
  Creates a campaign.

  ## Examples

      iex> create_campaign(%{field: value})
      {:ok, %Campaign{}}

      iex> create_campaign(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_campaign(attrs \\ %{}) do
    %Campaign{}
    |> Campaign.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a campaign.

  ## Examples

      iex> update_campaign(campaign, %{field: new_value})
      {:ok, %Campaign{}}

      iex> update_campaign(campaign, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_campaign(%Campaign{} = campaign, attrs) do
    campaign
    |> Campaign.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Campaign.

  ## Examples

      iex> delete_campaign(campaign)
      {:ok, %Campaign{}}

      iex> delete_campaign(campaign)
      {:error, %Ecto.Changeset{}}

  """
  def delete_campaign(%Campaign{} = campaign) do
    Repo.delete(campaign)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking campaign changes.

  ## Examples

      iex> change_campaign(campaign)
      %Ecto.Changeset{source: %Campaign{}}

  """
  def change_campaign(%Campaign{} = campaign) do
    Campaign.changeset(campaign, %{})
  end
end
