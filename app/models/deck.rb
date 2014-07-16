class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :flashcards

  validates :title, presence: true, length: {maximum: 50}


  def belongs_to?(user)
  	user == self.user
  end


end
