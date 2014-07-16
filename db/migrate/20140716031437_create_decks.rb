class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.references :user, index: true
      t.string :title

      t.timestamps
    end
  end
end
