class ColumnsController < ApplicationController
  before_action :set_column, only: [:show, :edit, :update]

  def index
    columns = Column.order(:id)
    render json: columns, include: {tasks: { include: [:user, :column], except: [:user_id, :column_id]}}
  end

  def show
    render json: @column, include: {tasks: { include: [:user, :column], except: [:user_id, :column_id]}}
  end

  def edit
  end

  def update
    if @column.update(column_params)
      render json: @column, status: :ok, location: @column, include: {tasks: { include: [:user, :column], except: [:user_id, :column_id]}}
    else
      render json: @column.errors, status: :unprocessable_entity
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_column
    @column = Column.find_by(id: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def column_params
    params.require(:column).permit(:label, :value, :id, :created_at, :updated_at)
  end
end
