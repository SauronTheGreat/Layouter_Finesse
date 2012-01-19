Given /^I have two clients "([^"]*)" and "([^"]*)"$/ do |arg1, arg2|
  # pending # express the regexp above with the code you wish you had

  Client.create!(:name=>"#{arg1}")
  Client.create!(:name=>"#{arg2}")

end

Given /^I have "([^"]*)" "([^"]*)"$/ do |arg1, arg2|
  arg1.to_i.times do |i|

    d=Date.today
    model_name=arg2.capitalize.singularize
    model_name=model_name.constantize
    column_names=model_name.column_names
    s=""
    column_names.each do |name|
      s=s+name+","
    end
    s.chomp!(",")


    values=""
    column_names.each_with_index do |column, index|
      if column=="id"
        values=values+(i+1).to_s+","

      elsif column=="created_at" or column=="updated_at"
        values=values+d.to_s+","

      else
        values=values+'"'+"#{arg2}_#{column}_#{i+1}"+'"'+","
      end


    end

    values.chomp!(",")

    sql="insert into #{arg2} (#{s}) values (#{values}) "
    ActiveRecord::Base.connection.execute(sql)

  end

end


When /^I am on "([^"]*)" page of "([^"]*)"$/ do |arg1, arg2|
#  pending # express the regexp above with the code you wish you had

  model_name=arg2.capitalize.singularize
    if (model_name.include?("_"))
      final_model_name=model_name.split("_")
      model=""
      final_model_name.each do |name|
        model=model+name.titleize
      end
    else
      model=model_name
    end

    model=model.constantize

    #model=arg2.singularize.capitalize.constantize

  @sample=model.first
  visit url_for :controller=>"#{arg2}", :action=>"#{arg1}",:id=>@sample.id

 # visit url_for :controller=>"#{arg2}", :action=>"#{arg1}"


end



When /^I fill in "([^"]*)" with "([^"]*)"$/ do |arg1, arg2|
  #pending # express the regexp above with the code you wish you had

  fill_in "#{arg1}", :with=>"#{arg2}"

end


Given /^I am on home page$/ do
  visit root_path
end

And /^I press the "([^"]*)" button$/ do |arg1|
  click_button "#{arg1}"
end

Given /^I sign in as "([^"]*)"$/ do |arg1|

  Given "I am on home page"
   When 'I fill in "Username" with '+'"'+arg1+'"'
   And 'I fill in "Password" with "finesse1"'
   And 'I press "Sign In" button'
   Then 'I should see "Signed in successfully"'

end
When /^I follow "([^"]*)" link of "([^"]*)"$/ do |arg1, arg2|
 # pending # express the regexp above with the code you wish you had

  model_name=arg2.capitalize.singularize
    if (model_name.include?("_"))
      final_model_name=model_name.split("_")
      model=""
      final_model_name.each do |name|
        model=model+name.titleize
      end
    else
      model=model_name
    end

    model=model.constantize

    #model=arg2.singularize.capitalize.constantize

  @sample=model.first
  visit url_for :controller=>"#{arg2}", :action=>"#{arg1}",:id=>@sample.id
end
Then /^I should not see "([^"]*)"$/ do |arg1|
  page.should_not have_content "#{arg1}"
end
When /^I select "([^"]*)" within "([^"]*)"$/ do |arg1, arg2|
  select "#{arg1}",:with=>"#{arg2}"
end

##########################################33


