class ProjectsController < ApplicationController
	before_action :set_user, only: [ :edit, :update, :destroy]
  before_filter :require_login, only: [:index, :new, :create,:show]

	 def index
	    
	  	@business = Business.all

	    #@stories =Story.all
	 end
	 def new
	  	@project=Project.new 
	 end
  

   def create


	# @user = current_user
 #    @project = User.find_by_id(params[:id]).projects.build(project_params)

	  	@project = current_user.projects.create(params[:project])
	     # = Project.new(project_params)

	    respond_to do |format|
	      if @project.save
	      	flash[:success] = "Project was successfully created!"

	        format.html { redirect_to projects_path}
	        format.json { render :show, status: :created, location: @project }
	      else
	        format.html { render :new }
	        format.json { render json: @project.errors, status: :unprocessable_entity }
	      end
	    end
	  end

	  def show
	   
	  	@business = Business.find(params[:id])

	  end

	  private 

	 

		def project_params
		  params.require(:project).permit(:name, :description,:id)
		end
		
		def correct_user
			@project = current_user.project.find_by_id(params[:id])
			redirect_to root_path if @project.nil?
		end


	

end
