class ShowcasesController < ApplicationController
  before_action :set_showcase, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_administrator!, except: [:index, :show]
	before_action :is_admin!, except: [:index, :show]
	
	def index
		@showcase = Showcase.all
	end

	def show
	end

	def new
		@showcase = Showcase.new
	end

	def edit	
	end

	def create
		@showcase = Showcase.new(showcase_params)
		if @showcase.save
			redirect_to @showcase
		else
			render 'new'
		end
	end

	def update
		if @showcase.update(showcase_params)
			redirect_to @showcase
		else
			render 'edit'
		end
	end

	def destroy
		if @showcase.destroy
			redirect_to root_path
		end
	end

	private

	def set_showcase
		@showcase = Showcase.find(params[:id])
	end

	def showcase_params
		params.require(:showcase).permit(:title, :model_number, :description, :image, :drawing, :category_type)
	end
end
