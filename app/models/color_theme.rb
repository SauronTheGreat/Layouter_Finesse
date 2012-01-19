class ColorTheme < ActiveRecord::Base
  attr_accessible :header_text_color, :extra_panel_color,:footer_panel_color,:navigation_panel_color, :back_color, :main_color, :highlight_color, :header_color, :text_color, :link_color, :link_color_hover, :icon_theme, :jquery_theme, :rounded_corners
end
