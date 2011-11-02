require 'test_helper'

class LayoutThemeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert LayoutTheme.new.valid?
  end
end
