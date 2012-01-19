class WelcomeController < ApplicationController



  def index
    @color_theme=ColorTheme.first
  end

  def home_page

  end


  def landing_page
    #this is the landing method for the home page
    #if the user has signed in as student, he should first see the complete list of simulations assigned to him/her
    if current_user.student

      if ActiveRound.any?
        @round=Round.find(ActiveRound.first.round_id)
        @simulation=Simulation.find(@round.simulation_id)
        @player=Player.find_by_student_group_id(StudentGroupUser.find_by_user_id(current_user.id).student_group_id)
        @brand=Brand.find_by_player_id(@player.id)
      end

    end
  end


  def participation_management


    @facilitator=Facilitator.find_by_user_id(current_user.id)
    @facilitator_group=FacilitatorGroup.find_by_facilitator_id(Facilitator.find_by_user_id(current_user.id).id)
    @students=@facilitator_group.users
    @student_group_users=Array.new(@students.count) { StudentGroupUser.new }
    @student_groups=@facilitator_group.student_groups
    @import=Import.new

    if !params[:student_group_id].blank?
      @selected_student_group=StudentGroup.find(params[:student_group_id])

    elsif @student_groups.count>0
      @selected_student_group=@student_groups[0]
    else
      @selected_student_group=0

    end


  end

  def set_participation


    @student_group_users = params[:student_group_users].values.collect { |sguser| StudentGroupUser.new(sguser) }
    @student_group_users.each do |sguser|
      if sguser.user_id!=0

        if !sguser.save
          render 'participation_management'
        end
      end
    end
    redirect_to participation_management_path(:student_group_id=>@student_group_users[0].student_group_id)

  end

  def remove_student

    @student_group_user=StudentGroupUser.find(params[:student_group_user_id])
    @student_group_id=@student_group_user.student_group_id
    if @student_group_user.destroy
      redirect_to participation_management_path(:student_group_id=>@student_group_id)

    end

  end

  def set_simulation

    @student_group=StudentGroup.find(params[:student_group_id])
    @student_group.simulation_id=params[:simulation_id]
    @simulation=Simulation.find(params[:simulation_id])
    if   @student_group.save
        Player.create_players_from_student_group(@student_group.id)

      redirect_to participation_management_path(:student_group_id=>@student_group_id)
    end


  end

  def remove_student_from_list
    @user=User.find(params[:user_id])
    @fg_user=FacilitatorGroupUser.find_by_user_id(@user.id)
    @fg_user.facilitator_group_id=nil
    @fg_user.save!
    redirect_to participation_management_path
  end


end
