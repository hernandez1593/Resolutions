class CreateResolution < ActiveRecord::Migration[5.2]
  def change
    create_table :resolutions do |t|
      t.string :title
      t.text :description
      t.string :code
      t.string :from
      t.string :to
      t.string :topic


      t.timestamps
    end
  end
end
