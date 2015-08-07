class RecordsController < ApplicationController
  def index
    @records = Record.all
  end

  def create
    binding.pry
    @record = Record.new(record_params)

    if @record.save
      works = true
      binding.pry
      render json: @record
    else
      works = false
      binding.pry
      render json: @record.errors, status: :unprocessable_entity
    end
  end

private
  def record_params
    params.require(:record).permit(:title, :amount, :date)
  end
end
