class PinsController < ApplicationController

	before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote]
	before_action :store_return_to, only: [:new, :show, :upvote]
	before_action :authenticate_user!, only: [:new, :show, :upvote]
	def index
		@pins = Pin.order("created_at DESC")
	end

	def new
		@pin = current_user.pins.build
	end 

	def create
		@pin = current_user.pins.build(pin_params)
		if @pin.save
			flash[:notice] = "Successfully created a Pin"
			redirect_to @pin
		else
			flash.now[:error] = "Error has occurred"
			render 'new'
		end
	end

	def show
        
	end

    def edit
    end

    def update
    	if @pin.update(pin_params)
    		flash[:notice] = "Successfully updated a Pin"
			redirect_to @pin
		else
			flash.now[:error] = "Error has occurred while updating"
			render 'new'
		end

    end

    def destroy
    	@pin.destroy
    	redirect_to root_path
    end

    def upvote
    	@pin.upvote_by current_user
    	redirect_to :back
    end

    private

    def pin_params
    	params.require(:pin).permit(:title, :desc, :image)
    end

    def find_pin
    	@pin = Pin.find(params[:id])
    end
end
