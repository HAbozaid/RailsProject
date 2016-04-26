class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]

  before_action :correct_user,   only: [:edit, :update]

  # GET /users
  # GET /users.json
  def index
    # @users = User.all
    @users = User.paginate(page: params[:page])

  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
     @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
      @user = User.new(user_params)
      
    if @user.save
      #       log_in @user

      #       flash[:success] = "Welcome to the Sample App!"
      # redirect_to @user
      @user.send_activation_email

       # UserMailer.account_activation(@user).deliver_now
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url



    else
      render 'new'
    end


    # @user = User.new(user_params)

    # respond_to do |format|
    #   if @user.save
    #     format.html { redirect_to @user, notice: 'User was successfully created.' }
    #     format.json { render :show, status: :created, location: @user }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end



  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end



  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



    def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end


  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
        params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)

    end


     # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end


     # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end





 # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end


  
end
