class OrdersController < ApplicationController
<<<<<<< HEAD
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
 def show
      @order = Order.find(params[:id])
      self.getUserNames
    end

def getUserNames
      @users= User.where(id: params[:id])
    #   users.all.each do |user|
      # user.name
    end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        if User.joins(:friendships).select('users.name').include? current_user.name
         @order.create_activity :create, owner: current_user
        end

        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
 def destroy
        _run_process_action_callbacks{ cancel }
  end

  def finish
    @order = Order.find(params[:id])
    if @order.update_attribute(:status, "finished")
        redirect_to @order
      else
        render 'index'
      end

  end
=======


	def create
	  @order = Order.new(order_all_params)
	  puts '-------------------' + @order.inspect + '----------------------------'
	  if @order.save
		  @order.create_activity :create, owner: current_user
	      redirect_to orders_path
	    else
	      render 'new'
	    end

	end

	def new
	  @order = Order.new
	end

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
>>>>>>> refs/remotes/origin/master

	def cancel
	@order = Order.find(params[:id])
	@order.destroy
	redirect_to orders_path
	end

<<<<<<< HEAD
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:for, :from, :menu_image, :status, :user_id)
    end


=======
	private
	  def order_params
	    params.require(:order).permit(:status)
	  end

	 def order_all_params
	 	 params.require(:order).permit(:status, :name ,:description)
	 end
>>>>>>> refs/remotes/origin/master

end
