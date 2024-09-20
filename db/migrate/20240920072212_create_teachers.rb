class CreateTeachers < ActiveRecord::Migration[7.2]
  def change
    create_table :teachers do |t|
      t.string :phone_number
      t.string :otp

      t.timestamps
    end
  end
end
