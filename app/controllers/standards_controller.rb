class StandardsController < ApplicationController
  before_action :set_standard, only: [:edit, :update, :destroy]
	before_action :authenticate_administrator!
	before_action :is_admin!

  def new
    @standard = Standard.new
	end

	def edit	
	end

	def create
		@standard = Standard.new(standard_params)
		if @standard.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def update
		if @standard.update(standard_params)
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def destroy
		if @standard.destroy
			redirect_to root_path
		end
	end

	private

	def set_standard
		@standard = Standard.find(params[:id])
	end

	def standard_params
		params.require(:standard).permit(:title, :model_number, :capacity, :voltage, :temperature, :compressor, :annex, :category_id)
	end
end
