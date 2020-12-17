class ShowcasesController < ApplicationController
  before_action :set_showcase, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_administrator!, except: [:index, :show]
	before_action :is_admin!, except: [:index, :show]
	before_action :add_index_breadcrumb, only: [:show, :new, :edit]
	
	def index
		
		if params[:category]
			@category_id = Category.find_by(name: params[:category]).id
			@showcase = Showcase.where(category_id: @category_id)
		else
			@showcase = Showcase.all
		end
		add_breadcrumb('Showcases')
	end

	def show
		add_breadcrumb(@showcase.title)
	end

	def new
		@showcase = Showcase.new
		add_breadcrumb("New")
	end

	def edit	
		add_breadcrumb(@showcase.title)
		add_breadcrumb("Edit")
	end

	def create
		@showcase = Showcase.new(showcase_params)
		# @showcase.category_id = @category.id
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
		params.require(:showcase).permit(:title, :model_number, :description, :product, :specification, :category_id)
	end

	def add_index_breadcrumb
		add_breadcrumb('Showcases', showcases_path)
	end
end
