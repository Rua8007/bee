class BugsController < ApplicationController
	skip_before_filter :require_login, only: [:index, :new, :create,:show]
  
  def index
  	@bug = Bug.all
  end

  def new
  	@bug = Bug.new 
  end

  def create

    	@bug = current_user.bugs.create(bug_params)
    respond_to do |format|
      if @bug.save

        format.html { redirect_to root_path, notice: 'Bug was successfully created.' }
        format.json { render :show, status: :created, location: @bug }
      else
        format.html { render :new }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end
  private
  def bug_params
	      params.require(:bug).permit(:title,:deadline, :description,:typ,:status,:id)
	  end
	
	def correct_user
		@bug = current_user.bug.find_by_id(params[:id])
		redirect_to root_path if @bug.nil?
	end

end
