module ApplicationHelper
  def color_scheme
    ColorTheme.first
  end

  def back_color
    color_scheme.back_color
  end

  def text_color
    color_scheme.text_color
  end

  def highlight_color
    color_scheme.highlight_color
  end

  def header_color
    color_scheme.header_color
  end

  def header_text_color
    color_scheme.header_text_color
  end

  def navigation_panel_color
    color_scheme.navigation_panel_color
  end

  def extra_panel_color
    color_scheme.extra_panel_color
  end

  def footer_panel_color
    color_scheme.footer_panel_color
  end

  def main_color
    color_scheme.main_color
  end

  def link_color
    color_scheme.link_color
  end

  def link_color_hover
    color_scheme.link_color_hover
  end

  def icon(name="new")
    "icon_packs/icon_pack_#{color_scheme.icon_theme}/#{name}.png"
  end

  def jquery_css
    color_scheme.jquery_theme
  end

  def rounded_corners
    color_scheme.rounded_corners
  end
  def home_page_layout
    # This is the master layout for all pages unless overridden by a pagelayout
    PageLayout.find_by_page_id(Page.first(:conditions=>['controller_name=? and action_name=?', "welcome", "index"]).id)
  end

  def current_page_layout(controller_name, action_name)
    # This returns the pagelayout for a page

    if this_page=Page.first(:conditions=>['controller_name=? and action_name=?', controller_name, action_name])
      PageLayout.find_by_page_id(this_page.id)
    else
      home_page_layout
    end
  end
end
