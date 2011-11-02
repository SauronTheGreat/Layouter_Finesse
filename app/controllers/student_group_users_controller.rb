class StudentGroupUsersController < ApplicationController
  # GET /student_group_users
  # GET /student_group_users.json
  def index
    @student_group_users = StudentGroupUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @student_group_users }
    end
  end

  # GET /student_group_users/1
  # GET /student_group_users/1.json
  def show
    @student_group_user = StudentGroupUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student_group_user }
    end
  end

  # GET /student_group_users/new
  # GET /student_group_users/new.json
  def new
    @users=User.all.collect{|user| if !user.superadmin and !user.admin and !user.facilitator then user end}.compact
    @student_group_users=Array.new(@users.count) { StudentGroupUser.new }
    #@student_group_user = StudentGroupUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student_group_user }
    end
  end

  # GET /student_group_users/1/edit
  def edit
    @student_group_user = StudentGroupUser.find(params[:id])
  end

  # POST /student_group_users
  # POST /student_group_users.json
  def create

    #@student_group_user = StudentGroupUser.new(params[:student_group_user])
   @users=User.all.collect{|user| if !user.superadmin and !user.admin and !user.facilitator then user end}.compact


    @student_group_users = params[:student_group_users].values.collect { |sguser| StudentGroupUser.new(sguser) }


    @student_group=StudentGroup.find(@student_group_users[0].student_group_id)
   StudentGroupUser.destroy @student_group.student_group_users(&:id)
   #@previous_student_group_users=@student_group.student_group_users



    @student_group_users.each_with_index do |sguser,index|

      if sguser.user_id !=0
      # sguser.user_id=@users[index].id
       sguser.save!
      end

    end


    respond_to do |format|
      if @student_group_users.all?(&:valid?)
       format.html{redirect_to @student_group}
        #format.html { redirect_to @student_group_user, notice: 'Student group user was successfully created.' }
        format.json { render json: @student_group_user, status: :created, location: @student_group_user }
      else
        format.html { render action: "new" }
        format.json { render json: @student_group_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /student_group_users/1
  # PUT /student_group_users/1.json
  def update
    @student_group_user = StudentGroupUser.find(params[:id])

    respond_to do |format|
      if @student_group_user.update_attributes(params[:student_group_user])
        format.html { redirect_to @student_group_user, notice: 'Student group user was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @student_group_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_group_users/1
  # DELETE /student_group_users/1.json
  def destroy
    @student_group_user = StudentGroupUser.find(params[:id])
    @student_group_user.destroy

    respond_to do |format|
      format.html { redirect_to student_group_users_url }
      format.json { head :ok }
    end
  end
end
