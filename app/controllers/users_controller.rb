class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @cars = Car.where(user_id: @user.id)
  end
  
  # GET /users/1/bids
  # Current user elotti implementacio
  def view_bids  	
  	@user = User.find(current_user.id) 
  	@bids = Bid.where(user_id: current_user.id)  
  end
  
  # GET /users/1/cars
  def view_cars
  	#p current_user.id
  	@user = User.find(current_user.id) 
  	@cars = Car.where(user_id: current_user.id)
  	
  	@carsArray = Hash.new(0)
  	
  	@cars.each do |car|
    		 hasBid = true
    		 if(Bid.where(car_id: car.id).empty?)
    		 	hasBid = false
    		 end
    		 @carsArray[car] = hasBid
    	end
  	  
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  	#@user.avatar.attach(params[:avatar])
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      	@user = User.find(current_user.id)
      	if @user.image.nil?
      		@user.image = "placeholder.jpeg"
      	end
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :password, :image, :avatar)
    end
end
