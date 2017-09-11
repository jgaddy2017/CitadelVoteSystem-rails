class CreateCadets < ActiveRecord::Migration[5.0]
  def change
    create_table :cadets do |t|
      t.string :cwid
      t.string :company

      t.timestamps
    end
  end
end
