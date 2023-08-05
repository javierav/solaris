class Archive < ApplicationRecord
  self.table_name = "archive"

  def self.create_from_inverter
    create(Inverter.new.data.to_h)
  end
end
