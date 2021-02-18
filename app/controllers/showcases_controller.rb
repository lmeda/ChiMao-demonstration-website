class ShowcasesController < ApplicationController
	layout "page"
  before_action :set_showcase, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_administrator!, except: [:index, :show]
	before_action :is_admin!, except: [:index, :show]
	before_action :add_home_breadcrumb
	before_action :add_index_breadcrumb, only: [:show, :new, :edit]
	
	def index
		#@s1 = Showcase.all.where(category_id: 1)
		if params[:category]
			@category_id = Category.find_by(name: params[:category]).id
			@showcase = Showcase.where(category_id: @category_id).order("created_at ASC")
		else
			@showcase = Showcase.all.order("created_at ASC")
		end
		add_breadcrumb('Showcases')
	end

	def show
		views = @showcase.views + 1
		@showcase.update(views: views)
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
		params.require(:showcase).permit(:title, :views, :model_number, :description, :capacity, :size, :voltage, :temperature, :compressor, :product, :specification, :category_id)
	end

	def add_home_breadcrumb
		add_breadcrumb('Product', product_path)
	end

	def add_index_breadcrumb
		add_breadcrumb('Showcases', showcases_path)
	end
end
