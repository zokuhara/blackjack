class Game < ActiveRecord::Base
  has_many :hands
  has_many :cards

  def player_wins?
    player_hand.total > dealer_hand.total
  end

  def build_cards
    card_order = (1..52).to_a.shuffle

    suits = %w(H C D S)
    suits.each do |suit|
      (2..10).each do |val|
        cards.create suit: suit, value: val, name: val, position: card_order.shift
      end
      ["J", "Q", "K"].each do |val|
        cards.create suit: suit, value: 10, name: val, position: card_order.shift
      end
      cards.create suit: suit, value: 11, name: "A", position: card_order.shift
    end
  end

  def deck
    #Undealt cards
    cards.where(hand_id: nil).order("position")
  end

  def player_hand
    hands.find_by player: true
  end

  def dealer_hand
    hands.find_by player: false
  end
end
