class RemoveColumnsFromCaseStudy < ActiveRecord::Migration
  def up
    remove_column :case_studies,:rounds
    remove_column :case_studies,:players

  end

  def down
  end
end
