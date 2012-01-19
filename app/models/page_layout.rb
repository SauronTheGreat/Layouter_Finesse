class PageLayout < ActiveRecord::Base
  attr_accessible :page_id, :layout_theme_id, :font_theme_id, :font_weight, :font_size, :theme_active
  belongs_to :page
  belongs_to :layout_theme
  belongs_to :font_theme
end
