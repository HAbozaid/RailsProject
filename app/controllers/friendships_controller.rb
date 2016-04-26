class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]

  # GET /friendships
  # GET /friendships.json
  def index
    @friendships = Friendship.all
    @friendship = Friendship.new
    @users = User.all
  end

  # GET /friendships/1
  # GET /friendships/1.json
  def show
  end

  # GET /friendships/new
  def new
    @friendship = Friendship.new
  end

  # GET /friendships/1/edit
  def edit
  end

  def create
    @usersByEmail = User.find_by(email: friendship_params[:friend_id])
    #puts "****************+@usersByEmail+************"
    friendship_params[:friend_id] = @usersByEmail.id

    @friendship = Friendship.new(friendship_params)

    if friendship_params[:friend_id] == friendship_params[:user_id] || Friendship.find_by(user_id: friendship_params[:user_id], friend_id: friendship_params[:friend_id] )
      
      respond_to do |format|
          format.html { redirect_to @friendship, notice: 'Friendship was Not created.' }
      end

    else

      respond_to do |format|
        if @friendship.save
          format.html { redirect_to @friendship, notice: 'Friendship was successfully created.' }
        else
          format.html { render :index }
          format.json { render json: @friendship.errors, status: :unprocessable_entity }
        end
      end
      
    end
  end



  # PATCH/PUT /friendships/1
  # PATCH/PUT /friendships/1.json
  def update
    respond_to do |format|
      if @friendship.update(friendship_params)
        format.html { redirect_to @friendship, notice: 'Friendship was successfully updated.' }
        format.json { render :show, status: :ok, location: @friendship }
      else
        format.html { render :edit }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to friendships_url, notice: 'Friendship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friendship_params
      params.require(:friendship).permit(:friend_id, :user_id)
    end
end
