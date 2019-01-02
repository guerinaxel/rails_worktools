class CreateShifts < ActiveRecord::Migration[5.1]
  def change
    create_table :shifts do |t|
      t.date :shift_date
      t.time :shift_time_start
      t.time :shift_time_end
      t.integer :shift_type

      t.timestamps
    end
  end
end
