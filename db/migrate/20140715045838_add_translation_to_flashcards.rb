class AddTranslationToFlashcards < ActiveRecord::Migration
  def change
    add_column :flashcards, :translation, :text
  end
end
