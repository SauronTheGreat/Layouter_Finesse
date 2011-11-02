class ConsumerMediaPreference < ActiveRecord::Base


  belongs_to :consumer_category

  # here we define a  a method to create media preferences for each consumer category

  def self.populate_consumer_category_preferences()
    ConsumerMediaPreference.destroy_all
    @consumer_categories=ConsumerCategory.all
    @media=Medium.all
    @media_ids=Array.new
    @media.each do |medium|
      @media_ids << medium.id
    end
    @consumer_categories.each do |consumer_category|

      @media_ids.shuffle!
      @media_ids.each_with_index do |medium, index|
        @consumer_media_preference=ConsumerMediaPreference.new
        @consumer_media_preference.media_id=medium
        @consumer_media_preference.consumer_category_id=consumer_category.id
        @consumer_media_preference.index=(index+1)
        @consumer_media_preference.save!
      end

    end


  end


end
