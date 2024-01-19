class CreateArchiveDailySolarEnergy < ActiveRecord::Migration[7.1]
  def change
    create_table :archive_daily_solar_energy, id: :date, primary_key: :date do |t|
      t.float :max, null: false
      t.datetime :maxtime, null: false
      t.float :sum, null: false
    end
  end
end
