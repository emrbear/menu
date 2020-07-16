class CreateCartes < ActiveRecord::Migration[5.2]
  def change
    create_table :cartes do |t|
      t.string   :title
      t.string   :subtitle
      t.text     :description
      t.integer  :position
      t.datetime :time_from
      t.datetime :time_until
      t.boolean  :active, default: false, null: false
      t.timestamps
    end
    add_index(:cartes, :position)
    add_index(:cartes, :active)
  end
end
