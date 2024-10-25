class ChangeEnumsInAppointment < ActiveRecord::Migration[7.2]
  def change
    remove_column :appointments, :clinic
    add_column :appointments, :clinic, :integer, default: 0

    remove_column :appointments, :purpose
    add_column :appointments, :purpose, :integer, default: 0
  end
end
