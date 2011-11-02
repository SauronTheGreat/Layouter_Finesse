require 'test_helper'

class PageLayoutTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert PageLayout.new.valid?
  end
end
