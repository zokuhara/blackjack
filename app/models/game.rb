class Game < ActiveRecord::Base
  has_many :hands
  has_many :cards
  
end
