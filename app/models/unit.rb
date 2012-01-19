class Unit < ActiveRecord::Base

  before_destroy :validate_delete

  def validate_delete
    if Medium.find_by_unit_id(self.id).nil?
      return true
    else

      return false
    end

  end
end
