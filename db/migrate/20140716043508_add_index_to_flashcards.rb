class AddIndexToFlashcards < ActiveRecord::Migration
  def change
  	add_index :flashcards, :deck_id
  end
end
