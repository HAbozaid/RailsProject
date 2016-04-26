class OrderDetailsController < ApplicationController
	def create
    @order = Order.find(params[:order_id])
    @order_detail = @order.order_details.create(order_details_params)
    redirect_to order_path(@order)
  end
 
  private
    def order_details_params
      params.require(:order_detail).permit(:item,:amount,:price,:comment, :user_id)
    end
end
