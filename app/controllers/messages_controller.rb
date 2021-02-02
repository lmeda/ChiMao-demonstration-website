class MessagesController < ApplicationController
	include MessagesHelper
  before_action :set_message, only: [:edit, :update, :destroy]
	before_action :authenticate_administrator!, except: [:index]
	before_action :is_admin!, except: [:index]
	
	def index
		@message = Message.all.order("created_at DESC")
		add_breadcrumb('News')
	end

	def new
		@message = Message.new
	end

	def edit
	end

	def create
		@message = Message.new(message_params)
		if @message.save
			redirect_to messages_path
		else
			render 'new'
		end
	end

	def update
		if @message.update(message_params)
			redirect_to messages_path
		else
			render 'edit'
		end
	end

	def destroy
		if @message.destroy
			redirect_to news_path
		end
	end

	private

	def set_message
		@message = Message.find(params[:id])
	end

	def message_params
		params.require(:message).permit(:title, :content)
	end
end
