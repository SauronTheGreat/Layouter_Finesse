class WelcomeController < ApplicationController
  def index
    @color_theme=ColorTheme.first
  end

  def landing_page
     #this is the landing method for the home page
    #if the user has signed in as student, he should first see the complete list of simulations assigned to him/her
    if current_user
      if current_user.student
        @student_group_users=StudentGroupUser.find_all_by_user_id(current_user.id)

        @simulations=Array.new
        @players=Array.new
        @student_group_users.each do |sguser|
          @simulations << Simulation.find_by_student_group_id(sguser.student_group_id)
          @players << Player.find_by_student_group_user_id(sguser.id)
        end


      end
    end
  end

end
