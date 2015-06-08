class BugsController < ApplicationController
	before_filter :require_login, only: [:index, :new, :create,:show]
  
  def index
  	@bugs = Bug.all
  
  end

 


  def new
  	@bug = Bug.new 
     @project=Project.all.pluck(:name, :id)
      @user=current_user.id
      @solver=User.where('cat' => 'Dev').pluck(:email, :id)

   
  end

  def create
# return render json: Project.find(params[:bug][:box][:project_id]).inspect
      @project=Project.all.pluck(:name, :id)
      @solver=User.where('cat' => 'Dev').pluck(:email, :id)
    	@bug = Project.find(params[:bug][:project_id]).bugs.create(bug_params)
     
     
    respond_to do |format|
      if @bug.save
        flash[:success] = "Bug was successfully created!"
        middle = Solver.new
        middle.bug_id = @bug.id
        middle.user_id  = params[:bug][:solver][:user_id]
        middle.save!
     
        

        format.html { redirect_to bugs_path }
        format.json { render :show, status: :created, location: @bug }
      else
        format.html { render :new }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
      @solver = Solver.find(params[:id])
  end

  private
  def bug_params
	      params.require(:bug).permit(:title,:deadline, :description,:typ,:status,:id,:image,:project_id,:creator_id)
  end
	
  def correct_user
		@bug = current_user.bug.find_by_id(params[:id])
		redirect_to root_path if @bug.nil?
  end

end
