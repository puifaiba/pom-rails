class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks or /tasks.json 
  def index
    tasks = Task.all
    render json: tasks, include: [:user, :column], except: [:user_id, :column_id]
  end

  def show
    render json: @task, include: [:user, :column], except: [:user_id, :column_id]
  end

  # GET /tasks/new
  def new
    task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    task = Task.new(task_params)

    if task.save
      render json: task, include: [:user, :column], except: [:user_id, :column_id], status: :created, location: card
    else
      render json: task.errors, status: :unprocessable_entity
    end
    
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    head :no_content, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :date, :tag, :column_id, :user_id)
    end
end
