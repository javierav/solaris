# RailsSettings Model
class Setting < RailsSettings::Base
  cache_prefix { "v1" }

  field :uuid, type: :string
  field :installation_power, type: :integer, default: 0
  field :installation_panels, type: :integer, default: 0
  field :installation_price, type: :integer, default: 0
  field :installation_date, type: :date
  field :installation_postal_code, type: :string
  field :inverter_brand, type: :string
  field :inverter_model, type: :string
  field :inverter_serial_number, type: :string
  field :viewed_at, type: :datetime
end
