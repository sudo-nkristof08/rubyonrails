class CarsController < ApplicationController
  before_action :set_car, only: %i[ show edit update destroy ]

  # GET /cars or /cars.json
  def index
    #@cars = Car.all
    #p @cars.length
    @cars = Car.where.not(user_id: current_user.id)
    
  end

  # GET /cars/1 or /cars/1.json
  def show
    @bids = Bid.where(car_id: @car.id).order("amount DESC")
  end

  # GET /cars/new
  def new
    #@car.user_id = current_user.id
    @car = Car.new()
  end

  # GET /cars/1/edit
  def edit
  
  	@car = Car.where(id: params[:id]).first
  	if(@car.user_id == current_user.id)
  		redirect_to root_path
  	end
  	
  end
  
  def create_bid
  	
  	#p params[:amount]
  	
  	url = "/cars/"+params[:car_id]
  	@car = Car.where(id: params[:car_id]).first
  	
  	if(@car.starting_price < params[:amount].to_i)
  		respond_to do |format|
  			format.html { redirect_to url }
  		end
  	end
  	
  		
  	@bid = Bid.new(
  		user_id: current_user.id ,
  		car_id: params[:car_id],
  		amount: params[:amount]
  	)
  	
  	@car.starting_price = params[:amount]
  	@car.save()
  	
  	respond_to do |format|
	  	if @bid.save()
	  		redirect_to url, notice: "Bid was successfully created." && return
	  	end
  	end
  end

  # POST /cars or /cars.json
  def create
    @car = Car.new(car_params)
    @car.user_id = current_user.id
    respond_to do |format|
      if @car.save
        format.html { redirect_to car_url(@car), notice: "Car was successfully created." }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1 or /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to car_url(@car), notice: "Car was successfully updated." }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1 or /cars/1.json
  def destroy
    @car.destroy

    respond_to do |format|
      format.html { redirect_to cars_url, notice: "Car was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def car_params
      params.require(:car).permit(:brand, :model, :BHP, :mileage, :starting_price, :image, :user_id, :picture)
    end
end
