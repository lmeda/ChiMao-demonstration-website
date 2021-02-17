class WorkbenchesController < ApplicationController
  before_action :set_workbench, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_administrator!, except: [:index, :show]
	before_action :is_admin!, except: [:index, :show]
	before_action :add_home_breadcrumb
	before_action :add_index_breadcrumb, only: [:show, :new, :edit]
	
	def index
		if params[:category]
			@category_id = Category.find_by(name: params[:category]).id
			@workbench = Workbench.where(category_id: @category_id)
		else
			@workbench = Workbench.all
		end
		add_breadcrumb('Workbenches')
	end

	def show
		add_breadcrumb(@workbench.title)
	end

	def new
		@workbench = Workbench.new
		add_breadcrumb("New")
	end

	def edit	
		add_breadcrumb(@workbench.title)
		add_breadcrumb("Edit")
	end

	def create
		@workbench = Workbench.new(workbench_params)
		# @showcase.category_id = @category.id
		if @workbench.save
			redirect_to @workbench
		else
			render 'new'
		end
	end

	def update
		if @workbench.update(workbench_params)
			redirect_to @workbench
		else
			render 'edit'
		end
	end

	def destroy
		if @workbench.destroy
			redirect_to root_path
		end
	end

	private

	def set_workbench
		@workbench = Workbench.find(params[:id])
	end

	def workbench_params
		params.require(:workbench).permit(:title, :model_number, :description, :product, :specification, :category_id)
	end

	def add_home_breadcrumb
		add_breadcrumb('Product', product_path)
	end

	def add_index_breadcrumb
		add_breadcrumb('Workbenches', workbenches_path)
	end
end
