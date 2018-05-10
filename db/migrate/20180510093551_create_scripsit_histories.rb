class CreateScripsitHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :scripsit_histories do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.string :to, array: true, null: false
      t.string :cc, array: true
      t.string :bcc, array: true
      t.string :subject, null: false
      t.text :body, null: false
      t.jsonb :data

      t.timestamps
    end
  end
end
