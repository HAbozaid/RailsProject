class InvitedsController < ApplicationController
  before_action :set_invited, only: [:show, :edit, :update, :destroy]

  # GET /inviteds
  # GET /inviteds.json
  def index
    @inviteds = Invited.all
  end

  # GET /inviteds/1
  # GET /inviteds/1.json
  def show
  end

  # GET /inviteds/new
  def new
    @invited = Invited.new
  end

  # GET /inviteds/1/edit
  def edit
  end

  # POST /inviteds
  # POST /inviteds.json
  def create
    @invited = Invited.new(invited_params)

    respond_to do |format|
      if @invited.save
        format.html { redirect_to @invited, notice: 'Invited was successfully created.' }
        format.json { render :show, status: :created, location: @invited }
      else
        format.html { render :new }
        format.json { render json: @invited.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inviteds/1
  # PATCH/PUT /inviteds/1.json
  def update
    respond_to do |format|
      if @invited.update(invited_params)
        format.html { redirect_to @invited, notice: 'Invited was successfully updated.' }
        format.json { render :show, status: :ok, location: @invited }
      else
        format.html { render :edit }
        format.json { render json: @invited.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inviteds/1
  # DELETE /inviteds/1.json
  def destroy
    @invited.destroy
    respond_to do |format|
      format.html { redirect_to inviteds_url, notice: 'Invited was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invited
      @invited = Invited.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invited_params
      params.require(:invited).permit(:order_id, :user_id)
    end
end
