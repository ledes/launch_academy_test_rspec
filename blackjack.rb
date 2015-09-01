require_relative 'deck'
require 'pry'

class Hand
  def initialize(cards)
    @cards = cards
  end

  def k_q_j_cards?(card)
git    card.include?('K') || card.include?('Q') || card.include?('J')
  end

  def numeric_card?(card)
    !card.include?('A')
  end


  def calculate_hand(cards)
    count = 0
    cards.each do |card|
      if k_q_j_cards?(card)
        count += 10
      elsif numeric_card?(card)
        count += card.to_i
      else
        if count > 10
          count += 1
        else
          count +=11
        end
      end
    end
    return count
  end
end

deck = Deck.new
cards = deck.deal(2)
hand = Hand.new(cards)
