class CreatePhysicians < ActiveRecord::Migration[6.0]
  def change
    create_table :physicians do |t|
      t.string :name
      t.string :title
      t.string :specialty

      t.timestamps
    end
  end
end
