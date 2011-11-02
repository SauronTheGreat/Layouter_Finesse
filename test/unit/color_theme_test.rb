require 'test_helper'

class ColorThemeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ColorTheme.new.valid?
  end
end
