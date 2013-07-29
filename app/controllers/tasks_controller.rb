class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy, :state_transition]

  def index
    current_user.root_task
    tasks = Task.where(:super_task_id => current_user.root_task).order(:index)
    render :index, :locals => { :tasks => tasks, :current_task => nil, :super_task => current_user.root_task}
  end

  def show
    task = Task.find(params[:id])
    sibling_tasks = task.super_task.sub_tasks.order(:index)
    super_task = task.super_task
    render :index, :locals => { :tasks => sibling_tasks, :current_task => task, :super_task => super_task }
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render action: 'show', status: :created, location: @task }
      else
        format.html { render action: 'new' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  def state_transition
    next_action = @task.next_actions.detect { |action| action.name == params[:state_transition] }
    if next_action
      @task.update_attributes(:state => next_action.resulting_state)
      flash[:notice] = "Task #{@task.state.name}"
      redirect_to task_path(@task)
    else
      flash[:error] = "You can't go to the state."
      redirect_to :back
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:author_id, :type_id, :notes, :status_id, :index, :points)
    end
end
