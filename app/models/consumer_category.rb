class MyValidator < ActiveModel::Validator
  def validate(record)
    if record.price_range.first+record.dealer_push_range.first+record.media_push_range.first+record.personal_taste_range.first > 100
      record.errors[:base] << 'The minimum rage has to be less than 100 !'
    end
  end
end

#######################################################################################################
#The code above is custom validator

class ConsumerCategory < ActiveRecord::Base

  serialize :price_range
  serialize :dealer_push_range
  serialize :media_push_range
  serialize :personal_taste_range
  has_many :consumer_media_preferences, :dependent => :destroy


  before_validation :convert_ranges


  def convert_ranges
    self.price_range=self.price_range.split('..').inject { |s, e| s.to_i..e.to_i }
    self.dealer_push_range=self.dealer_push_range.split('..').inject { |s, e| s.to_i..e.to_i }
    self.media_push_range=self.media_push_range.split('..').inject { |s, e| s.to_i..e.to_i }
    self.personal_taste_range=self.personal_taste_range.split('..').inject { |s, e| s.to_i..e.to_i }


  end

  include ActiveModel::Validations
  validates_with MyValidator

end
