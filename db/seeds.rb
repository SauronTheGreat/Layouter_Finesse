# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


# Layout Themes
LayoutTheme.create!(:name=>"1. FlatLand  (main:12)", :number=>1)
LayoutTheme.create!(:name=>"2. Bracket (header:12) (nav-panel:2 | main:10) (extra:2 | footer:10)", :number=>2)
LayoutTheme.create!(:name=>"3. Sandwich (header:3 | nav-panel:9) (main:12) (extra:2 | footer:10)", :number=>3)
LayoutTheme.create!(:name=>"4. Sliver ( (header)(nav-panel):2 | (main):10 )", :number=>4)
LayoutTheme.create!(:name=>"5. Toothy (header:12)((nav-panel)(extra):2 | (main):10 ) (footer:12)", :number=>5)
LayoutTheme.create!(:name=>"6. Trident (header:12)(nav-panel:3 | main:6 | extra:3) (footer:12)", :number=>6)


# Font Themes

FontTheme.create!(:name=>"Arial")
FontTheme.create!(:name=>"Arial Black")
FontTheme.create!(:name=>"Comic Sans MS")
FontTheme.create!(:name=>"Georgia")
FontTheme.create!(:name=>"Impact")
FontTheme.create!(:name=>"Times New Roman")
FontTheme.create!(:name=>"Verdana")
FontTheme.create!(:name=>"Trebuchet MS")

# Icon Themes

IconTheme.create!(:name=>"Blue and White Squares", :number=>"1")
IconTheme.create!(:name=>"Transparent Glass", :number=>"2")
IconTheme.create!(:name=>"Antique Copper Orbs", :number=>"3")
IconTheme.create!(:name=>"Green Glowing Orbs", :number=>"4")
IconTheme.create!(:name=>"Orange Glowing Orbs", :number=>"5")
IconTheme.create!(:name=>"Blue Glowing Orbs", :number=>"6")
IconTheme.create!(:name=>"Red Squares", :number=>"7")

# JQuery Themes

JqueryTheme.create!(:name=>"UI lightness", :number=>"1")
JqueryTheme.create!(:name=>"UI darkness", :number=>"2")
JqueryTheme.create!(:name=>"Smoothness", :number=>"3")
JqueryTheme.create!(:name=>"Start", :number=>"4")
JqueryTheme.create!(:name=>"Redmond", :number=>"5")
JqueryTheme.create!(:name=>"Sunny", :number=>"6")
JqueryTheme.create!(:name=>"Scarlet O'Hara'", :number=>"7")


# Home Page, Layout Page and Theme Page Initialization

Page.create!(:controller_name=>"welcome", :action_name=>"index")
PageLayout.create!(:page_id=>1, :layout_theme_id=>1, :font_theme_id=>1, :font_weight=>"normal", :font_size=>"12", :theme_active=>true)
Page.create!(:controller_name=>"color_themes", :action_name=>"edit")
Page.create!(:controller_name=>"page_layouts", :action_name=>"edit")
Page.create!(:controller_name=>"page_layouts", :action_name=>"new")
Page.create!(:controller_name=>"plugin_samples", :action_name=>"index")
PageLayout.create!(:page_id=>2, :layout_theme_id=>1, :font_theme_id=>1, :font_weight=>"normal", :font_size=>"12", :theme_active=>true)
PageLayout.create!(:page_id=>3, :layout_theme_id=>1, :font_theme_id=>1, :font_weight=>"normal", :font_size=>"12", :theme_active=>true)
PageLayout.create!(:page_id=>4, :layout_theme_id=>1, :font_theme_id=>1, :font_weight=>"normal", :font_size=>"12", :theme_active=>true)
PageLayout.create!(:page_id=>5, :layout_theme_id=>1, :font_theme_id=>1, :font_weight=>"normal", :font_size=>"12", :theme_active=>true)
ColorTheme.create!(:back_color=>"ffffff", :main_color=>"ffffff", :navigation_panel_color=>"aaffaa", :extra_panel_color=>"00bfbf", :footer_panel_color=>"ffd4aa", :highlight_color=>"ffffff", :text_color=>"000000", :header_color=>"ffaa56", :link_color=>"000000", :link_color_hover=>"000000", :icon_theme=>"7", :jquery_theme=>"7", :rounded_corners=>false)

# Plugin Samples

PluginSample.create!(:name=>"Equal-Height-Columns", :description=>"Equalize the heights of multiple columns", :script_markup=>"$('#column1, #column2, #column3').equalHeightColumns();", :html_markup=>"<div style='width:100%'><div id='column1' style='float:left;width:33%;background:red;border 1px solid darkred;'>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut dolor mi, rutrum nec molestie id, condimentum commodo elit. Quisque sodales imperdiet dolor, et elementum dolor viverra non. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In hac habitasse platea dictumst.</div><div id='column2' style='background:blue;float:right;width:33%;border 1px solid darkblue;'>Cras pharetra eros non enim euismod consectetur. Nunc a eros in ligula ultricies porta. Nullam nisi ipsum, consectetur sit amet dignissim non, fermentum eget justo. Aliquam id nulla a elit varius porttitor egestas eu risus. Ut sed magna est. Maecenas id nunc et elit sagittis mattis eget nec libero. Donec adipiscing imperdiet dignissim. Aliquam ut pharetra libero. In mi enim, venenatis mollis convallis in, posuere cursus est.</div><div id='column3' style='background:grey;float:left;width:34%;border 1px solid darkred;'>Curabitur aliquet lectus a quam sagittis sit amet elementum mauris vestibulum. Mauris laoreet risus sed sem ullamcorper in rhoncus urna consequat. Aliquam aliquam elit ac urna blandit viverra. In hac habitasse platea dictumst. Donec ut tortor libero. Etiam bibendum pretium blandit. Sed lectus leo; commodo sed adipiscing ac, venenatis a leo</div></div>'")
PluginSample.create!(:name=>"jPicker", :description=>"A PopUp Color Picker", :script_markup=>"$('.color_picker').jPicker({window:{expandable: true}});", :html_markup=>" <div class='color_picker'> Color Picker </div>")
PluginSample.create!(:name=>"Slides", :description=>"A Simple Image Slider", :script_markup=>"$('#slides').slides({preload: true,preloadImage: 'orbit.png',play: 2500,pause: 2500,hoverPause: true,effect: 'slide, fade',crossfade: false,slideSpeed: 500,fadeSpeed: 500});", :html_markup=>"<div id='slides'><div class='slides_container' style='padding:20px'><div style='border:solid 3px black'><br/><br/>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut dolor mi, rutrum nec molestie id, condimentum commodo elit. Quisque sodales imperdiet dolor, et elementum dolor viverra non. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In hac habitasse platea dictumst.</div><div style='border:solid 3px black'><br/><br/>Curabitur aliquet lectus a quam sagittis sit amet elementum mauris vestibulum. Mauris laoreet risus sed sem ullamcorper in rhoncus urna consequat. Aliquam aliquam elit ac urna blandit viverra. In hac habitasse platea dictumst. Donec ut tortor libero. Etiam bibendum pretium blandit. Sed lectus leo; commodo sed adipiscing ac, venenatis a leo</div></div><a href='#' class='prev' id='prev_button'><img src='../assets/arrow-prev.png' width='24' height='43' alt='Arrow Prev'></a><a href='#' class='next' id='next_button'><img src='../assets/arrow-next.png' width='24' height='43' alt='Arrow Next'></a></div><br/>", :lesson=>"<%= stylesheet_link_tag 'Slides' %>")
PluginSample.create!(:name=>"CSS-Mac-Dock-Menu", :description=>"A Mac OS style navigation Menu", :script_markup=>"$('#dock2').Fisheye({maxWidth: 60,items: 'a',itemsText: 'span',container: '.dock-container2',itemWidth: 40,proximity: 80,alignment : 'left',valign: 'bottom',halign : 'center'})", :html_markup=>"<div class='dock' id='dock2'><div class='dock-container2'><a class='dock-item2' href='#'><a class='dock-item2' href='#'><span>Home</span><img src='../assets/images/home.png' alt='home' /></a><a class='dock-item2' href='#'><span>Contact</span><img src='../assets/images/email.png' alt='contact' /></a><a class='dock-item2' href='#'><span>Portfolio</span><img src='../assets/images/portfolio.png' alt='portfolio' /></a><a class='dock-item2' href='#'><span>Music</span><img src='../assets/images/music.png' alt='music' /></a><a class='dock-item2' href='#'><span>Video</span><img src='../assets/images/video.png' alt='video' /></a><a class='dock-item2' href='#'><span>History</span><img src='../assets/images/history.png' alt='history' /></a><a class='dock-item2' href='#'><span>Calendar</span><img src='../assets/images/calendar.png' alt='calendar' /></a><a class='dock-item2' href='#'><span>Links</span><img src='../assets/images/link.png' alt='links' /></a><a class='dock-item2' href='#'><span>RSS</span><img src='../assets/images/rss.png' alt='rss' /></a><a class='dock-item2' href='#'><span>RSS2</span><img src='../assets/images/rss2.png' alt='rss' /></a></div></div>", :lesson=>"<%= stylesheet_link_tag 'CSS-Mac-Dock-Menu' %>")
PluginSample.create!(:name=>"SlideDownBox", :description=>"A Nifty Horizontal Menu", :script_markup=>"$('#sdt_menu > li').bind('mouseenter',function(){var $elem = $(this);$elem.find('img').stop(true).animate({'width':'170px','height':'170px','left':'0px'},400,'easeOutBack').andSelf().find('.sdt_wrap').stop(true).animate({'top':'140px'},500,'easeOutBack').andSelf().find('.sdt_active').stop(true).animate({'height':'170px'},300,function(){var $sub_menu = $elem.find('.sdt_box');if($sub_menu.length){var left = '170px';if($elem.parent().children().length == $elem.index()+1)left = '-170px';$sub_menu.show().animate({'left':left},200);}});}).bind('mouseleave',function(){var $elem = $(this);var $sub_menu = $elem.find('.sdt_box');if($sub_menu.length)$sub_menu.hide().css('left','0px');$elem.find('.sdt_active').stop(true).animate({'height':'0px'},300).andSelf().find('img').stop(true).animate({'width':'0px','height':'0px','left':'85px'},400).andSelf().find('.sdt_wrap').stop(true).animate({'top':'25px'},500);});", :html_markup=>"<br/><br/><br/><br/><br/><br/><div class='content'><ul id='sdt_menu' class='sdt_menu'><li><a href='#'><img src='../assets/images/2.jpg' alt=''/><span class='sdt_active'></span><span class='sdt_wrap'><span class='sdt_link'>About me</span><span class='sdt_descr'>Get to know me</span></span></a></li><li><a href='#'><img src='../assets/images/1.jpg' alt=''/><span class='sdt_active'></span><span class='sdt_wrap'><span class='sdt_link'>Portfolio</span><span class='sdt_descr'>My work</span></span></a><div class='sdt_box'><a href='#'>Websites</a><a href='#'>Illustrations</a><a href='#'>Photography</a></div></li><li><a href='#'><img src='../assets/images/3.jpg' alt=''/><span class='sdt_active'></span><span class='sdt_wrap'><span class='sdt_link'>Inspiration</span><span class='sdt_descr'>Where ideas get born</span></span></a></li><li><a href='#'><img src='../assets/images/4.jpg' alt=''/><span class='sdt_active'></span><span class='sdt_wrap'><span class='sdt_link'>Photos</span><span class='sdt_descr'>I like to photograph</span></span></a></li><li><a href='#'><img src='../assets/images/6.jpg' alt=''/><span class='sdt_active'></span><span class='sdt_wrap'><span class='sdt_link'>Projects</span><span class='sdt_descr'>I like to code</span></span></a><div class='sdt_box'><a href='#'>Job Board Website</a><a href='#'>Shopping Cart</a><a href='#'>Interactive Maps</a></div></li></ul></div><div>", :lesson=>"<%= stylesheet_link_tag 'SlideDownBox' %>")
PluginSample.create!(:name=>"Quicksand", :description=>"A Selector Sorter of Lists", :script_markup=>"// Custom sorting plugin
(function($) {
  $.fn.sorted = function(customOptions) {
    var options = {
      reversed: false,
      by: function(a) { return a.text(); }
    };
    $.extend(options, customOptions);
    $data = $(this);
    arr = $data.get();
    arr.sort(function(a, b) {
      var valA = options.by($(a));
      var valB = options.by($(b));
      if (options.reversed) {
        return (valA < valB) ? 1 : (valA > valB) ? -1 : 0;
      } else {
        return (valA < valB) ? -1 : (valA > valB) ? 1 : 0;
      }
    });
    return $(arr);
  };
})(jQuery);

// DOMContentLoaded
$(function() {

  // bind radiobuttons in the form

  var $filterType = $('#filter input[name='type']');
  var $filterSort = $('#filter input[name='sort']');

  // get the first collection
  var $applications = $('#applications');

  // clone applications to get a second collection
  var $data = $applications.clone();

  // attempt to call Quicksand on every form change
  $filterType.add($filterSort).change(function(e) {
    if ($($filterType+':checked').val() == 'all') {
      var $filteredData = $data.find('li');
    } else {
      var $filteredData = $data.find('li[data-type=' + $($filterType+':checked').val() + ']');
    }

    // if sorted by size
    if ($('#filter input[name='sort']:checked').val() == 'size') {
      var $sortedData = $filteredData.sorted({
        by: function(v) {
          return parseFloat($(v).find('span[data-type=size]').text());
        }
      });
    } else {
      // if sorted by name
      var $sortedData = $filteredData.sorted({
        by: function(v) {
          return $(v).find('strong').text().toLowerCase();
        }
      });
    }

    // finally, call quicksand
    $applications.quicksand($sortedData, {
      duration: 800,
      easing: 'easeInOutQuad'
    });

  });

});", :html_markup=>"

          <form id='filter'>
        		<fieldset>
        			<legend>Filter by type</legend>
        			<label><input name='type' value='all' checked='checked' type='radio'>Everything</label>
        			<label><input name='type' value='app' type='radio'>Applications</label>
        			<label><input name='type' value='util' type='radio'>Utilities</label>
        <br/>        <br/>        			<legend>Sort by</legend>
        			<label><input name='sort' value='size' checked='checked' type='radio'>Size</label>
        			<label><input name='sort' value='name' type='radio'>Name</label>
        		</fieldset>
        	</form>
        <br/>        <br/>        <br/>
          <ul id='applications' class='image-grid'>
            <li data-id='id-1' data-type='util'>
              <img src='../assets/images/activity-monitor.png' alt='' height='128' width='128'>
              <strong>Activity Monitor</strong>
              <span data-type='size'>348 KB</span>
            </li>
            <li data-id='id-2' data-type='app'>
              <img src='../assets/images/address-book.png' alt='' height='128' width='128'>
              <strong>Address Book</strong>
              <span data-type='size'>1904 KB</span>
            </li>
            <li data-id='id-3' data-type='app'>
              <img src='../assets/images/finder.png' alt='' height='128' width='128'>
              <strong>Finder</strong>
              <span data-type='size'>1337 KB</span>
            </li>
            <li data-id='id-4' data-type='app'>
              <img src='../assets/images/front-row.png' alt='' height='128' width='128'>
              <strong>Front Row</strong>
              <span data-type='size'>401 KB</span>
            </li>
            <li data-id='id-5' data-type='app'>
              <img src='../assets/images/google-pokemon.png' alt='' height='128' width='128'>
              <strong>Google Pokemon</strong>
              <span data-type='size'>12875 KB</span>
            </li>
            <li data-id='id-6' data-type='app'>
              <img src='../assets/images/ical.png' alt='' height='128' width='128'>
              <strong>iCal</strong>
              <span data-type='size'>5273 KB</span>
            </li>
            <li data-id='id-7' data-type='app'>
              <img src='../assets/images/ichat.png' alt='' height='128' width='128'>
              <strong>iChat</strong>
              <span data-type='size'>5437 KB</span>
            </li>
            <li data-id='id-8' data-type='app'>
              <img src='../assets/images/interface-builder.png' alt='' height='128' width='128'>
              <strong>Interface Builder</strong>
              <span data-type='size'>2764 KB</span>
            </li>
            <li data-id='id-9' data-type='app'>
              <img src='../assets/images/ituna.png' alt='' height='128' width='128'>
              <strong>iTuna</strong>
              <span data-type='size'>17612 KB</span>
            </li>
            <li data-id='id-10' data-type='util'>
              <img src='../assets/images/keychain-access.png' alt='' height='128' width='128'>
              <strong>Keychain Access</strong>
              <span data-type='size'>972 KB</span>
            </li>
            <li data-id='id-11' data-type='util'>
              <img src='../assets/images/network-utility.png' alt='' height='128' width='128'>
              <strong>Network Utility</strong>
              <span data-type='size'>245 KB</span>
            </li>
            <li data-id='id-12' data-type='util'>
              <img src='../assets/images/sync.png' alt='' height='128' width='128'>
              <strong>Sync</strong>
              <span data-type='size'>3788 KB</span>
            </li>
            <li data-id='id-13' data-type='app'>
              <img src='../assets/images/textedit.png' alt='' height='128' width='128'>
              <strong>TextEdit</strong>
              <span data-type='size'>1669 KB</span>
            </li>
          </ul>



   ", :lesson=>"<%= stylesheet_link_tag 'Quicksand' %>")
PluginSample.create!(:name=>"JQuery-Presentation", :description=>"A Presentation Builder", :script_markup=>"$('#presentation_slides').presentation({
 slide: '.presentation_slide',
 pagerClass: 'nav-pager',
 prevNextClass: 'nav-prev-next',
 prevText: 'Previous',
 nextText: 'Next',
 transition: 'hide'});", :html_markup=>"<div id='presentation_content'>
<div id='presentation_slides'>
        <div class='presentation_slide'>
          <h2>Slide 1</h2>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
          <ul>
           <li>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</li>
           <li>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</li>
           <li>Here is a short list item</li>
          </ul>

        </div>
        <div class='presentation_slide'>
          <h2>Slide 2</h2>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
        </div>
        <div class='presentation_slide'>
          <h2>Slide 3</h2>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
        </div>
        <div class='presentation_slide'>
          <h2>Slide 4</h2>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
        </div>
        <div class='presentation_slide'>
          <h2>Slide 5</h2>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
        </div>
       </div>
     </div>", :lesson=>"<%= stylesheet_link_tag 'JQuery-Presentation' %>")
PluginSample.create!(:name=>"Jquery-Media", :description=>"Low effort video integration into the web page", :script_markup=>"$('.media').media();", :html_markup=>"<a class='media' href='/assets/videos/edubridge.flv'></a>")
#PluginSample.create!(:name=>"", :description=>"", :script_markup=>"", :html_markup=>"")


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


@user=User.create!(:email=>"superadmin@finesse.com", :first_name=>"super", :last_name=>"admin", :username=>"superadmin", :password=>"finesse1", :password_confirmation=>"finesse1", :admin=>false, :super_admin=>true, :facilitator=>false)
@user.superadmin=true
@user.admin=false
@user.facilitator=false
@user.student=false
@user.save!

@user=User.create!(:email=>"admin@finesse.com", :first_name=>"normal", :last_name=>"admin", :username=>"admin", :password=>"finesse1", :password_confirmation=>"finesse1", :admin=>true, :super_admin=>false, :facilitator=>false)
@user.superadmin=false
@user.admin=true
@user.facilitator=false
@user.student=false
@user.save!


@user=User.create!(:email=>"facilitator@finesse.com", :first_name=>"normal", :last_name=>"facilitator", :username=>"facilitator", :password=>"finesse1", :password_confirmation=>"finesse1", :admin=>false, :super_admin=>false, :facilitator=>true)
@user.superadmin=false
@user.admin=false
@user.facilitator=true
@user.student=false
@user.save!


@user=User.find_by_username("facilitator")
Facilitator.create!(:user_id=>@user.id, :client_id=>1)

@constants=Constant.create!(:name=>"a", :value=>10)
@constants=Constant.create!(:name=>"k", :value=>10)

DealerCategory.create!(:name=>"National")
DealerCategory.create!(:name=>"Local")

Impact.create!(:name=>"HIGH")
Impact.create!(:name=>"LOW")
Impact.create!(:name=>"MEDIUM")


ExpenseType.create!(:name=>"Finance and Interest cost")
ExpenseType.create!(:name=>"Power and Fuel")
ExpenseType.create!(:name=>"Labour and wages")
ExpenseType.create!(:name=>"Stores and spares")
ExpenseType.create!(:name=>"Packing materials")
ExpenseType.create!(:name=>"Stores and spares")
ExpenseType.create!(:name=>"Insurance")
ExpenseType.create!(:name=>"Freight and Forwarding")
ExpenseType.create!(:name=>"Travelling and conveyance")
ExpenseType.create!(:name=>"Repairs")
ExpenseType.create!(:name=>"HR")
ExpenseType.create!(:name=>"Media")
ExpenseType.create!(:name=>"Channel")
ExpenseType.create!(:name=>"Factory")
ExpenseType.create!(:name=>"Miscellaneous")


Unit.create!(:name=>'secs')
Unit.create!(:name=>'size')
Unit.create!(:name=>'color')
Unit.create!(:name=>'time-slot')
Unit.create!(:name=>'tenor')


####seed data which is only for test####
#
#ConsumerCategory.create!(:name=>"category1", :price_range=>"15..25", :personal_taste_range=>"30..40", :media_push_range=>"20..30", :dealer_push_range=>"35..70",:annual_consumption=>1000)
#ConsumerCategory.create!(:name=>"category2", :price_range=>"35..75", :personal_taste_range=>"10..40", :media_push_range=>"20..30", :dealer_push_range=>"35..70",:annual_consumption=>1000)
#ConsumerCategory.create!(:name=>"category3", :price_range=>"30..40", :personal_taste_range=>"15..40", :media_push_range=>"20..30", :dealer_push_range=>"35..70",:annual_consumption=>1000)
#ConsumerCategory.create!(:name=>"category4", :price_range=>"20..30", :personal_taste_range=>"15..40", :media_push_range=>"30..50", :dealer_push_range=>"35..70",:annual_consumption=>1000)


#@national_dealer=DealerCategory.find_by_name("National")
#Dealer.create!(:name=>"national_dealer1", :catchment_of_consumers=>1000, :desired_commission=>10, :dealer_category_id=>@national_dealer.id)
#Dealer.create!(:name=>"national_dealer2", :catchment_of_consumers=>1000, :desired_commission=>10, :dealer_category_id=>@national_dealer.id)
#Dealer.create!(:name=>"national_dealer3", :catchment_of_consumers=>1000, :desired_commission=>10, :dealer_category_id=>@national_dealer.id)
#
#
Market.create!(:name=>"Bangalore", :catchment_of_dealers=>100, :catchment_of_vendors=>10, :no_of_consumers=>9500)
Market.create!(:name=>"Mumbai", :catchment_of_dealers=>100, :catchment_of_vendors=>10, :no_of_consumers=>20600)
Market.create!(:name=>"nagpur", :catchment_of_dealers=>100, :catchment_of_vendors=>10, :no_of_consumers=>4600)
Market.create!(:name=>"Pune", :catchment_of_dealers=>100, :catchment_of_vendors=>10, :no_of_consumers=>9400)
Market.create!(:name=>"New Delhi", :catchment_of_dealers=>100, :catchment_of_vendors=>10, :no_of_consumers=>16500)
Market.create!(:name=>"Gurgoan", :catchment_of_dealers=>100, :catchment_of_vendors=>10, :no_of_consumers=>1500)
Market.create!(:name=>"Chennai", :catchment_of_dealers=>100, :catchment_of_vendors=>10, :no_of_consumers=>4700)
Market.create!(:name=>"Hyderabad", :catchment_of_dealers=>100, :catchment_of_vendors=>10, :no_of_consumers=>4000)
Market.create!(:name=>"Kolkata", :catchment_of_dealers=>100, :catchment_of_vendors=>10, :no_of_consumers=>18000)
Market.create!(:name=>"Ahmadabad", :catchment_of_dealers=>100, :catchment_of_vendors=>10, :no_of_consumers=>7200)
Market.create!(:name=>"Chandigarh", :catchment_of_dealers=>100, :catchment_of_vendors=>10, :no_of_consumers=>1000)


#banglore
MarketDistance.create!(:source_market_id=>1,:target_market_id=>2,:distance=>998)
MarketDistance.create!(:source_market_id=>1,:target_market_id=>3,:distance=>1049)
MarketDistance.create!(:source_market_id=>1,:target_market_id=>4,:distance=>835)
MarketDistance.create!(:source_market_id=>1,:target_market_id=>5,:distance=>2061)
MarketDistance.create!(:source_market_id=>1,:target_market_id=>6,:distance=>2054)
MarketDistance.create!(:source_market_id=>1,:target_market_id=>7,:distance=>331)
MarketDistance.create!(:source_market_id=>1,:target_market_id=>8,:distance=>562)
MarketDistance.create!(:source_market_id=>1,:target_market_id=>9,:distance=>1881)
MarketDistance.create!(:source_market_id=>1,:target_market_id=>10,:distance=>1495)
MarketDistance.create!(:source_market_id=>1,:target_market_id=>11,:distance=>2298)


#Mumbai
MarketDistance.create!(:source_market_id=>2,:target_market_id=>3,:distance=>863)
MarketDistance.create!(:source_market_id=>2,:target_market_id=>4,:distance=>163)
MarketDistance.create!(:source_market_id=>2,:target_market_id=>5,:distance=>1407)
MarketDistance.create!(:source_market_id=>2,:target_market_id=>6,:distance=>1393)
MarketDistance.create!(:source_market_id=>2,:target_market_id=>7,:distance=>1329)
MarketDistance.create!(:source_market_id=>2,:target_market_id=>8,:distance=>711)
MarketDistance.create!(:source_market_id=>2,:target_market_id=>9,:distance=>1987)
MarketDistance.create!(:source_market_id=>2,:target_market_id=>10,:distance=>491)
MarketDistance.create!(:source_market_id=>2,:target_market_id=>11,:distance=>1637)

#nagpur
MarketDistance.create!(:source_market_id=>3,:target_market_id=>4,:distance=>880)
MarketDistance.create!(:source_market_id=>3,:target_market_id=>5,:distance=>1012)
MarketDistance.create!(:source_market_id=>3,:target_market_id=>6,:distance=>1042)
MarketDistance.create!(:source_market_id=>3,:target_market_id=>7,:distance=>1083)
MarketDistance.create!(:source_market_id=>3,:target_market_id=>8,:distance=>487)
MarketDistance.create!(:source_market_id=>3,:target_market_id=>9,:distance=>1124)
MarketDistance.create!(:source_market_id=>3,:target_market_id=>10,:distance=>970)
MarketDistance.create!(:source_market_id=>3,:target_market_id=>11,:distance=>1249)

#Pune
MarketDistance.create!(:source_market_id=>4,:target_market_id=>5,:distance=>1417)
MarketDistance.create!(:source_market_id=>4,:target_market_id=>6,:distance=>1416)
MarketDistance.create!(:source_market_id=>4,:target_market_id=>7,:distance=>1166)
MarketDistance.create!(:source_market_id=>4,:target_market_id=>8,:distance=>548)
MarketDistance.create!(:source_market_id=>4,:target_market_id=>9,:distance=>2004)
MarketDistance.create!(:source_market_id=>4,:target_market_id=>10,:distance=>660)
MarketDistance.create!(:source_market_id=>4,:target_market_id=>11,:distance=>1654)

#Delhi
MarketDistance.create!(:source_market_id=>5,:target_market_id=>6,:distance=>30)
MarketDistance.create!(:source_market_id=>5,:target_market_id=>7,:distance=>2095)
MarketDistance.create!(:source_market_id=>5,:target_market_id=>8,:distance=>1499)
MarketDistance.create!(:source_market_id=>5,:target_market_id=>9,:distance=>1416)
MarketDistance.create!(:source_market_id=>5,:target_market_id=>10,:distance=>915)
MarketDistance.create!(:source_market_id=>5,:target_market_id=>11,:distance=>238)

#Gurgoan
MarketDistance.create!(:source_market_id=>6,:target_market_id=>7,:distance=>2088)
MarketDistance.create!(:source_market_id=>6,:target_market_id=>8,:distance=>1492)
MarketDistance.create!(:source_market_id=>6,:target_market_id=>9,:distance=>1426)
MarketDistance.create!(:source_market_id=>6,:target_market_id=>10,:distance=>885)
MarketDistance.create!(:source_market_id=>6,:target_market_id=>11,:distance=>268)


#Chennai
MarketDistance.create!(:source_market_id=>7,:target_market_id=>8,:distance=>688)
MarketDistance.create!(:source_market_id=>7,:target_market_id=>9,:distance=>1676)
MarketDistance.create!(:source_market_id=>7,:target_market_id=>10,:distance=>1826)
MarketDistance.create!(:source_market_id=>7,:target_market_id=>11,:distance=>2224)

#Hyderabad
MarketDistance.create!(:source_market_id=>8,:target_market_id=>9,:distance=>1516)
MarketDistance.create!(:source_market_id=>8,:target_market_id=>10,:distance=>1208)
MarketDistance.create!(:source_market_id=>8,:target_market_id=>11,:distance=>1736)

#Kolkata
MarketDistance.create!(:source_market_id=>9,:target_market_id=>10,:distance=>1924)
MarketDistance.create!(:source_market_id=>9,:target_market_id=>11,:distance=>1646)

#Ahemdabad
MarketDistance.create!(:source_market_id=>10,:target_market_id=>11,:distance=>1153)





#
#Factory.create!(:name=>"factory1", :number_of_employees=>1120, :number_of_shifts=>3, :market_id=>1, :cost_to_build=>1000000, :cost_to_run=>10000, :capacity=>1200, :production_time_per_unit=>12, :price=>100000000)
#Factory.create!(:name=>"factory2", :number_of_employees=>2120, :number_of_shifts=>3, :market_id=>2, :cost_to_build=>1000000, :cost_to_run=>10000, :capacity=>1200, :production_time_per_unit=>12, :price=>100000000)
#Factory.create!(:name=>"factory3", :number_of_employees=>120, :number_of_shifts=>3, :market_id=>3, :cost_to_build=>1000000, :cost_to_run=>10000, :capacity=>1200, :production_time_per_unit=>12, :price=>100000000)
#Factory.create!(:name=>"factory4", :number_of_employees=>5000, :number_of_shifts=>3, :market_id=>4, :cost_to_build=>1000000, :cost_to_run=>10000, :capacity=>1200, :production_time_per_unit=>12, :price=>100000000)
#


InvestmentType.create!(:name=>"Equity")
InvestmentType.create!(:name=>"Mutual Fund")
InvestmentType.create!(:name=>"Bullion")
InvestmentType.create!(:name=>"Deposits")
InvestmentType.create!(:name=>"Cash")
InvestmentType.create!(:name=>"Real Estate")
InvestmentType.create!(:name=>"Government Securities")
InvestmentType.create!(:name=>"Depository Receipts")
InvestmentType.create!(:name=>"Commodities")
InvestmentType.create!(:name=>"Futures and Derivatives")


LoanType.create!(:name=>"Long Term Loan")
LoanType.create!(:name=>"Working Capital Demand Loan")
LoanType.create!(:name=>"Cash Credit")
LoanType.create!(:name=>"Bill Discounting")
LoanType.create!(:name=>"Letters Of Credit")
LoanType.create!(:name=>"Pre Shipment Finance")
LoanType.create!(:name=>"Post Shipment Finance")
LoanType.create!(:name=>"Bridge Loans")
LoanType.create!(:name=>"Project Financing")
LoanType.create!(:name=>"Promoter Funding")


Medium.create!(:name=>"Television Prime Slot", :cost=>1000, :impact_id=>1, :unit_id=>1)
Medium.create!(:name=>"Centre Fold Newspaper", :cost=>300, :impact_id=>2, :unit_id=>2)
Medium.create!(:name=>"Front Page Newspaper", :cost=>400, :impact_id=>1, :unit_id=>2)
Medium.create!(:name=>"Centre Fold Magazine", :cost=>200, :impact_id=>2, :unit_id=>2)
Medium.create!(:name=>"Front Page Magazine", :cost=>100, :impact_id=>2, :unit_id=>2)
#Medium.create!(:name=>"Other Print", :cost=>700, :impact_id=>2, :unit_id=>3)
Medium.create!(:name=>"Television Mid-day Slot", :cost=>800, :impact_id=>2, :unit_id=>1)
Medium.create!(:name=>"Radio Mid-day Slot", :cost=>500, :impact_id=>3, :unit_id=>1)
Medium.create!(:name=>"Radio prime Slot", :cost=>700, :impact_id=>1, :unit_id=>1)
Medium.create!(:name=>"Internet", :cost=>200, :impact_id=>2, :unit_id=>5)
Medium.create!(:name=>"Pamphlets", :cost=>100, :impact_id=>3, :unit_id=>2)
Medium.create!(:name=>"Hoardings", :cost=>200, :impact_id=>3, :unit_id=>2)


RawMaterial.create!(:name=>"steel", :price_per_kg=>1000)
RawMaterial.create!(:name=>"carbon", :price_per_kg=>1200)
RawMaterial.create!(:name=>"rubber", :price_per_kg=>800)
RawMaterial.create!(:name=>"water", :price_per_kg=>10)
RawMaterial.create!(:name=>"iron", :price_per_kg=>1600)
RawMaterial.create!(:name=>"glass", :price_per_kg=>200)
RawMaterial.create!(:name=>"Cotton", :price_per_kg=>400)
RawMaterial.create!(:name=>"Timber", :price_per_kg=>200)
RawMaterial.create!(:name=>"Chemicals", :price_per_kg=>300)
RawMaterial.create!(:name=>"Cement", :price_per_kg=>100)


DecisionParameter.create!(:name=>"Base Salary")
DecisionParameter.create!(:name=>"Credit Availability")
DecisionParameter.create!(:name=>"Personal Taste")
DecisionParameter.create!(:name=>"Social Standing")
DecisionParameter.create!(:name=>"Fundamental Needs")


EmployeeCategory.create!(:name=>"Senior Management",:base_effect_on_sales=>1,:base_effect_on_quality_cost=>1,:base_salary=>2500000)
EmployeeCategory.create!(:name=>"Sales and marketing",:base_effect_on_sales=>1,:base_effect_on_quality_cost=>1,:base_salary=>1500000)
EmployeeCategory.create!(:name=>"Operations",:base_effect_on_sales=>1,:base_effect_on_quality_cost=>1,:base_salary=>1000000)
EmployeeCategory.create!(:name=>"Labour",:base_effect_on_sales=>1,:base_effect_on_quality_cost=>1,:base_salary=>300000)



#EnvironmentalParameter.create!(:name=>"EnvironmentalParameter1",:value=>10)
#EnvironmentalParameter.create!(:name=>"EnvironmentalParameter2",:value=>12)
#EnvironmentalParameter.create!(:name=>"EnvironmentalParameter3",:value=>101)
#EnvironmentalParameter.create!(:name=>"EnvironmentalParameter4",:value=>112)


#consumer categories
#
#ConsumerCategory.create!(:name=>"Rich",:price_range=>,:personal_taste_range=>,:dealer_push_range=>,:media_push_range=>,:annual_consumption=>)
#ConsumerCategory.create!(:name=>"",:price_range=>,:personal_taste_range=>,:dealer_push_range=>,:media_push_range=>,:annual_consumption=>)
#ConsumerCategory.create!(:name=>"",:price_range=>,:personal_taste_range=>,:dealer_push_range=>,:media_push_range=>,:annual_consumption=>)
#ConsumerCategory.create!(:name=>"",:price_range=>,:personal_taste_range=>,:dealer_push_range=>,:media_push_range=>,:annual_consumption=>)
#ConsumerCategory.create!(:name=>"",:price_range=>,:personal_taste_range=>,:dealer_push_range=>,:media_push_range=>,:annual_consumption=>)












