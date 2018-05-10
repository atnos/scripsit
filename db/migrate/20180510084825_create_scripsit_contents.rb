class CreateScripsitContents < ActiveRecord::Migration[5.2]
  def change
    create_table :scripsit_contents do |t|
      t.string :subject, null: false
      t.text :body, null: false
      t.boolean :active, null: false, default: false
      t.references :scripsit_slug, foreign_key: true, null: false

      t.timestamps
    end
  end
end
