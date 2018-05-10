class CreateScripsitSlugs < ActiveRecord::Migration[5.2]
  def change
    create_table :scripsit_slugs do |t|
      t.string :name, null: false
      t.string :slug, null: false

      t.timestamps
    end
    add_index :scripsit_slugs, :slug, unique: true
  end
end
