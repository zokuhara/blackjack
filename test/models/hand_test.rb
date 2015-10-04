require "test_helper"

class HandTest < ActiveSupport::TestCase
  def hand
    @hand ||= Hand.new
  end

  def test_valid
    assert hand.valid?
  end
end
