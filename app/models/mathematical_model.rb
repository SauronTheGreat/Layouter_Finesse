class MathematicalModel < ActiveRecord::Base
  has_many :mathematical_model_constants
  has_many :mathematical_model_variables
end

