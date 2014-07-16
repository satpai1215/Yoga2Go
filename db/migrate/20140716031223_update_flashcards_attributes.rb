class UpdateFlashcardsAttributes < ActiveRecord::Migration
  def change
  	remove_column :flashcards, :title, :string
  	remove_column :flashcards, :translation, :text
  	add_column :flashcards, :side_one, :text
  	add_column :flashcards, :side_two, :text
  	add_column :flashcards, :deck_id, :integer
  end
end
