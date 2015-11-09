class PinsController < ApplicationController

	before_action :find_pin, only: [:show, :edit, :update, :destroy]
	def index
		@pins = Pin.order("created_at DESC")
	end

	def new
		@pin = Pin.new
	end 

	def create
		@pin = Pin.new(pin_params)
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

    private

    def pin_params
    	params.require(:pin).permit(:title, :desc)
    end

    def find_pin
    	@pin = Pin.find(params[:id])
    end
end
