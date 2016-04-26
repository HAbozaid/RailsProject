class OrdersController < ApplicationController

	def show
    	@order = Order.find(params[:id])
    	self.getUserNames
  	end

 	def index
    @orders = Order.all
  	end

  	def getUserNames
    	@users= User.where(id: params[:id])
    # 	users.all.each do |user|
  		# user.name
  	end

	def destroy
	      _run_process_action_callbacks{ cancel }
	end

    def update
    	_run_process_action_callbacks{ finish }
	end

	def finish
		@order = Order.find(params[:id])
		if @order.update_attribute(:status, "finished")
		    redirect_to @order
		  else
		    render 'index'
		  end

	end

	def cancel
	@order = Order.find(params[:id])
	@order.destroy
	redirect_to orders_path
	end

	private
	  def order_params
	    params.require(:order).permit(:status)
	  end

end
