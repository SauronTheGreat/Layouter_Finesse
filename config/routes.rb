Layouter::Application.routes.draw do
  resources :environmental_decision_parameters

  resources :market_demographics

  resources :mentality_values

  resources :mentality_rankings

  resources :mentalities

  resources :mentality_parameters

  resources :factory_vendors

  resources :plugin_samples

  resources :jquery_themes

  resources :font_themes

  resources :icon_themes

  resources :temps

  resources :pages

  resources :page_layouts

  resources :layout_themes

  resources :color_themes

  # get "welcome/index"
  match '/jquery_sample' => 'color_themes#jquery_sample'
  match '/icon_sample' => 'color_themes#icon_sample'
  match '/check_theme' => 'page_layouts#check_theme'


  resources :brands

  resources :player_round_factories

  resources :round_media_plans

  resources :player_round_loans

  resources :player_round_investments

  resources :player_round_expenses

  resources :default_player_data

  resources :players

  resources :player_financials

  resources :imports

  resources :games

  resources :student_group_users

  resources :round_loans

  resources :loan_types

  resources :investment_types

  resources :round_expenses

  resources :employees

  resources :employee_categories

  resources :constants

  resources :round_investments

  resources :media_plan_details

  resources :media_plans

  resources :impacts

  resources :units

  resources :expense_types

  resources :hrincentives

  resources :simulation_decision_parameters

  resources :simulation_markets

  resources :simulation_factories

  resources :student_groups

  resources :facilitator_groups

  resources :product_parameters

  resources :raw_materials

  resources :products

  resources :mathematical_model_variable_values

  resources :available_decision_parameters

  resources :mathematical_model_constant_values

  resources :mathematical_model_variables

  resources :mathematical_model_constants

  resources :round_environmental_parameters

  resources :expense_options

  resources :expenses

  resources :case_studies

  resources :player_investments

  resources :investments

  resources :player_loans

  resources :loans

  resources :media

  resources :consumer_brand_selection_parameters

  resources :brand_selection_parameters

  resources :consumer_media_preferences

  resources :consumer_categories

  resources :consumers

  resources :vendors

  resources :dealer_categories

  resources :dealer_push_indices

  resources :dealers

  resources :market_consumer_categories

  resources :market_distances

  resources :factories

  resources :markets

  resources :rounds

  resources :simulations

  resources :mathematical_model_inputs

  resources :mathematical_models

  resources :decision_parameters

  resources :environmental_parameters

  resources :facilitators

  resources :clients

  devise_for :users do
    get '/users/sign_out'=>'devise/sessions#destroy'
  end

  root :to=>'welcome#landing_page'

  match 'home_page'=>'welcome#home_page'

  match "define_constant_value"=>'decision_parameters#define_constant_value'
  match "set_constant_value"=>'decision_parameters#set_constant_value'
  match "define_variable_values"=>'decision_parameters#define_variable_values'
  match "set_variable_values"=>'decision_parameters#set_variable_values'
  match 'details'=>'decision_parameters#view_details'
  match 'view_parameters'=>'products#view_parameters'
  match 'view_expenses'=>'expenses#view_expenses'
  match 'view_distances'=>'markets#view_distances'
  match 'initiate_game'=>'games#initiate_game'
  match "get_student_group"=>'simulations#get_student_group'
  match "set_student_group"=>'simulations#set_student_group'
  match 'initiate_simulation'=>'simulations#initiate_simulation'
  match "register_as_expense"=>'media_plans#register_as_expense'
  match 'landing_page'=>'welcome#landing_page'
  match 'populate_rate_of_interest'=>'rounds#populate_rate_of_interest'
  match 'populate_depreciation'=>'rounds#populate_depreciation'
  match 'set_rate_of_interest'=>'rounds#set_rate_of_interest'
  match 'set_depreciation'=>'rounds#set_depreciation'
  match 'finalize_media_plan'=>'media_plans#finalize_media_plan'
  match 'select_initiate_simulation'=>'simulations#select_initiate_simulation'
  match 'view_tabular_market_distance'=>'market_distances#view_tabular_distances'
  match 'initiate_round_calculation'=>'simulations#initiate_round_calculation'
  match 'view_map'=>'markets#view_maps'
  match 'set_location'=>'markets#set_location'
  match 'update_market_distance'=>'market_distances#update_distances'
  match 'participation_management'=>'welcome#participation_management'
  match 'set_participation'=>'welcome#set_participation'
  match 'remove_student/:student_group_user_id', :to=>'welcome#remove_student'
  match 'set_simulation'=>'welcome#set_simulation'
  match 'remove_student_from_list/:user_id'=>'welcome#remove_student_from_list'
  match 'remove_media_plan_detail'=>'media_plans#remove_media_plan_detail'
  match 'register_as_expense'=>'media_plans#register_as_expense'


end
