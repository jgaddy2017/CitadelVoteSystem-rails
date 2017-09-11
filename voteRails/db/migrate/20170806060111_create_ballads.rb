class CreateBallads < ActiveRecord::Migration[5.0]
  def change
    create_table :ballads do |t|
      t.string :cadetCwid
      t.string :candidateId

      t.timestamps
    end
  end
end
