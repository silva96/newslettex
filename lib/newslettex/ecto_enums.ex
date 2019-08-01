import EctoEnum
defenum(ListStatusEnum, :list_status, [:importing, :imported])
defenum(CampaignStatusEnum, :campaign_status, [:draft, :sending, :sent])

defenum(CampaignContactEventTypeEnum, :campaign_contact_event_type, [
  :send,
  :delivery,
  :open,
  :click,
  :bounce,
  :complaint,
  :reject
])
