When /^There are no user populated yet$/ do
  User.where('student=true').destroy_all
end

Then /^Student group related to facilitator group should get deleted$/ do
 @student_groups = StudentGroup.where('facilitator_group_id=1')
     if @student_groups > 0
      assert false
      else
      assert true
 end
 end
Then /^Students related to student group should get deleted$/ do
  @student_group_user = StudentGroupUser.where('student_group_id=1')
       if @student_group_users > 0
        assert false
        else
        assert true
   end

end