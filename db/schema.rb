# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120116060027) do

  create_table "active_rounds", :force => true do |t|
    t.integer  "round_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "simulation_id"
  end

  create_table "brand_selection_parameters", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brands", :force => true do |t|
    t.integer  "player_id"
    t.string   "name"
    t.integer  "price_per_unit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "simulation_id"
  end

  create_table "case_studies", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "facilitator_id"
  end

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "client_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "color_themes", :force => true do |t|
    t.string   "back_color"
    t.string   "main_color"
    t.string   "highlight_color"
    t.string   "header_color"
    t.string   "header_text_color"
    t.string   "navigation_panel_color"
    t.string   "extra_panel_color"
    t.string   "footer_panel_color"
    t.string   "text_color"
    t.string   "link_color"
    t.string   "link_color_hover"
    t.integer  "icon_theme"
    t.integer  "jquery_theme"
    t.boolean  "rounded_corners"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "constants", :force => true do |t|
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consumer_brand_selection_parameters", :force => true do |t|
    t.integer  "brand_selection_parameter_id"
    t.integer  "min_value"
    t.integer  "max_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consumer_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "price_range"
    t.text     "personal_taste_range"
    t.text     "dealer_push_range"
    t.text     "media_push_range"
    t.integer  "annual_consumption"
    t.integer  "mentality_id"
    t.text     "disposable_salary_range"
  end

  create_table "consumer_media_preferences", :force => true do |t|
    t.integer  "media_id"
    t.integer  "consumer_category_id"
    t.integer  "index"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consumers", :force => true do |t|
    t.integer  "consumer_category_id"
    t.integer  "dealer_id"
    t.integer  "personal_taste_index"
    t.integer  "final_decision"
    t.integer  "probability_of_purchase"
    t.integer  "brand_power"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "brand_id"
    t.integer  "price_index"
    t.integer  "dealer_push_index"
    t.integer  "media_push_index"
    t.integer  "disposable_salary"
    t.integer  "round_id"
    t.integer  "no_of_units"
  end

  create_table "dealer_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dealer_preferences", :force => true do |t|
    t.integer  "dealer_id"
    t.integer  "expense_id"
    t.integer  "index"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dealer_push_indices", :force => true do |t|
    t.integer  "dealer_id"
    t.integer  "brand_id"
    t.integer  "push_index_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dealers", :force => true do |t|
    t.string   "name"
    t.integer  "market_id"
    t.integer  "catchment_of_consumers"
    t.integer  "desired_commission"
    t.integer  "final_commission"
    t.integer  "dealer_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "round_id"
  end

  create_table "decision_parameters", :force => true do |t|
    t.string   "name"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "default_player_data", :force => true do |t|
    t.integer  "income"
    t.integer  "cogs"
    t.integer  "employee_cost"
    t.integer  "sga"
    t.integer  "ebitda"
    t.integer  "interest_cost"
    t.integer  "investment_income"
    t.integer  "depreciation_cost"
    t.integer  "pbt"
    t.integer  "tax"
    t.integer  "pat"
    t.integer  "long_term_loans"
    t.integer  "short_term_loans"
    t.integer  "net_worth"
    t.integer  "fixed_assets"
    t.integer  "investments"
    t.integer  "inventory"
    t.integer  "cash"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "total_assets"
  end

  create_table "employee_categories", :force => true do |t|
    t.string   "name"
    t.integer  "base_effect_on_sales"
    t.integer  "base_salary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "base_effect_on_quality_cost"
  end

  create_table "employees", :force => true do |t|
    t.integer  "employee_category_id"
    t.integer  "efficiency"
    t.integer  "happiness_quotient"
    t.integer  "cost"
    t.integer  "effect_on_quality_cost"
    t.integer  "effect_on_sales"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "factory_id"
  end

  create_table "environmental_decision_parameters", :force => true do |t|
    t.integer  "environmental_parameter_id"
    t.integer  "decision_parameter_id"
    t.integer  "mathematical_model_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "environmental_parameters", :force => true do |t|
    t.string   "name"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expense_options", :force => true do |t|
    t.string   "name"
    t.integer  "expense_id"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expense_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expenses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number_of_options"
    t.integer  "expense_type_id"
    t.integer  "source_id"
    t.text     "summary"
  end

  create_table "facilitator_group_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "facilitator_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facilitator_groups", :force => true do |t|
    t.integer  "facilitator_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facilitators", :force => true do |t|
    t.integer  "user_id"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "factories", :force => true do |t|
    t.string   "name"
    t.integer  "number_of_employees"
    t.integer  "market_id"
    t.integer  "number_of_shifts"
    t.integer  "cost_to_build"
    t.integer  "cost_to_run"
    t.integer  "capacity"
    t.integer  "production_time_per_unit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "total_employee_cost"
    t.integer  "price"
  end

  create_table "factory_vendors", :force => true do |t|
    t.integer  "vendor_id"
    t.integer  "factory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "distance"
  end

  create_table "font_themes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", :force => true do |t|
    t.integer  "simulation_id"
    t.integer  "student_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "facilitator_id"
  end

  create_table "hrincentives", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "icon_themes", :force => true do |t|
    t.string   "name"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "impacts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "imports", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "excel_list_file_name"
    t.string   "excel_list_content_type"
    t.integer  "excel_list_file_size"
    t.datetime "excel_list_updated_at"
    t.integer  "facilitator_group_id"
  end

  create_table "investment_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "investments", :force => true do |t|
    t.string   "name"
    t.string   "investment_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "sigma"
    t.float    "mu"
  end

  create_table "jquery_themes", :force => true do |t|
    t.string   "name"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "layout_themes", :force => true do |t|
    t.string   "name"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loan_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loans", :force => true do |t|
    t.string   "name"
    t.integer  "loan_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "market_consumer_categories", :force => true do |t|
    t.integer  "market_id"
    t.integer  "consumer_category_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "market_demographics", :force => true do |t|
    t.integer  "market_id"
    t.integer  "consumer_category_id"
    t.integer  "proportion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "market_distances", :force => true do |t|
    t.integer  "source_market_id"
    t.integer  "target_market_id"
    t.integer  "distance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "markets", :force => true do |t|
    t.string   "name"
    t.integer  "catchment_of_dealers"
    t.integer  "catchment_of_vendors"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "no_of_consumers"
    t.integer  "positionx"
    t.integer  "positiony"
    t.string   "market_image_file_name"
  end

  create_table "mathematical_model_constant_values", :force => true do |t|
    t.integer  "mathematical_model_constant_id"
    t.integer  "value"
    t.integer  "decision_parameter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mathematical_model_constants", :force => true do |t|
    t.integer  "mathematical_model_id"
    t.string   "constant_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mathematical_model_inputs", :force => true do |t|
    t.integer  "mathematical_model_id"
    t.integer  "environmental_parameter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mathematical_model_variable_values", :force => true do |t|
    t.integer  "environmental_parameter_id"
    t.integer  "decision_parameter_id"
    t.integer  "mathematical_model_variable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mathematical_model_variables", :force => true do |t|
    t.integer  "mathematical_model_id"
    t.string   "variable_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mathematical_models", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "media", :force => true do |t|
    t.string   "name"
    t.integer  "cost"
    t.integer  "impact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "unit_id"
  end

  create_table "media_plan_details", :force => true do |t|
    t.integer  "media_plan_id"
    t.integer  "media_id"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "no_of_unit"
  end

  create_table "media_plans", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "registered_as_expense"
  end

  create_table "mentalities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mentality_parameters", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mentality_rankings", :force => true do |t|
    t.integer  "mentality_id"
    t.integer  "mentality_parameter_id"
    t.integer  "index"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "range_value"
  end

  create_table "mentality_values", :force => true do |t|
    t.integer  "mentality_id"
    t.integer  "mentality_parameter_id"
    t.text     "value_range"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "index"
  end

  create_table "page_layouts", :force => true do |t|
    t.integer  "page_id"
    t.integer  "layout_theme_id"
    t.integer  "font_theme_id"
    t.string   "font_weight"
    t.integer  "font_size"
    t.boolean  "theme_active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "controller_name"
    t.string   "action_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_financials", :force => true do |t|
    t.integer  "round_id"
    t.integer  "player_id"
    t.integer  "income"
    t.integer  "cogs"
    t.integer  "employee_cost"
    t.integer  "sga"
    t.integer  "ebitda"
    t.integer  "interest_cost"
    t.integer  "investment_income"
    t.integer  "depreciation_cost"
    t.integer  "pbt"
    t.integer  "tax"
    t.integer  "pat"
    t.integer  "long_term_loans"
    t.integer  "short_term_loans"
    t.integer  "net_worth"
    t.integer  "fixed_assets"
    t.integer  "investments"
    t.integer  "inventory"
    t.integer  "cash"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "total_assets"
  end

  create_table "player_investments", :force => true do |t|
    t.integer  "player_id"
    t.integer  "investment_id"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_loans", :force => true do |t|
    t.integer  "player_id"
    t.integer  "loan_id"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_round_expenses", :force => true do |t|
    t.integer  "player_id"
    t.integer  "round_id"
    t.integer  "expense_id"
    t.integer  "expense_option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "brand_id"
  end

  create_table "player_round_factories", :force => true do |t|
    t.integer  "player_id"
    t.integer  "round_id"
    t.integer  "factory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "brand_id"
  end

  create_table "player_round_investments", :force => true do |t|
    t.integer  "player_id"
    t.integer  "round_id"
    t.integer  "investment_id"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "brand_id"
  end

  create_table "player_round_loans", :force => true do |t|
    t.integer  "player_id"
    t.integer  "round_id"
    t.integer  "loan_id"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "brand_id"
  end

  create_table "players", :force => true do |t|
    t.integer  "student_group_user_id"
    t.integer  "simulation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_group_id"
    t.boolean  "played",                :default => false
    t.integer  "last_played"
  end

  create_table "plugin_samples", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "script_markup"
    t.text     "html_markup"
    t.text     "lesson"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_parameters", :force => true do |t|
    t.integer  "product_id"
    t.integer  "raw_material_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number_of_parameters"
    t.integer  "weight"
    t.integer  "mfg_cost"
    t.integer  "mentality_parameter_id"
    t.string   "product_image_file_name"
  end

  create_table "raw_materials", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price_per_kg"
  end

  create_table "round_environmental_parameters", :force => true do |t|
    t.integer  "round_id"
    t.integer  "environmental_parameter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "amount"
  end

  create_table "round_expenses", :force => true do |t|
    t.integer  "round_id"
    t.integer  "expense_id"
    t.text     "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "visible",    :default => true
  end

  create_table "round_investments", :force => true do |t|
    t.integer  "investment_id"
    t.integer  "mu"
    t.integer  "sigma"
    t.integer  "roi"
    t.integer  "round_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "round_loans", :force => true do |t|
    t.integer  "round_id"
    t.integer  "loan_id"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "round_media_plans", :force => true do |t|
    t.integer  "round_id"
    t.integer  "media_plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rounds", :force => true do |t|
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "simulation_id"
    t.integer  "rate_of_interest"
    t.integer  "depreciation"
    t.boolean  "calculated",       :default => false
  end

  create_table "simulation_decision_parameters", :force => true do |t|
    t.integer  "simulation_id"
    t.integer  "decision_parameter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "simulation_markets", :force => true do |t|
    t.integer  "simulation_id"
    t.integer  "market_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "simulations", :force => true do |t|
    t.string   "name"
    t.integer  "facilitator_id"
    t.integer  "max_players"
    t.integer  "max_rounds"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "freight_cost"
    t.integer  "weight_per_unit"
    t.integer  "product_id"
    t.integer  "case_study_id"
    t.integer  "student_group_id"
    t.integer  "tax_rate"
    t.boolean  "initiated"
    t.text     "summary"
  end

  create_table "student_group_users", :force => true do |t|
    t.integer  "student_group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_groups", :force => true do |t|
    t.string   "name"
    t.integer  "facilitator_group_id"
    t.integer  "case_study_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "simulation_id"
  end

  create_table "units", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "admin"
    t.boolean  "superadmin"
    t.boolean  "facilitator"
    t.boolean  "student"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "vendors", :force => true do |t|
    t.string   "name"
    t.integer  "market_id"
    t.integer  "raw_material_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
