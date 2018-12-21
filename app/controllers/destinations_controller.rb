class DestinationsController < ApplicationController
  before_action :find_params, only: [:show, :edit, :update, :like, :destroy]

  def index
    @destinations = Destination.all
  end

  def show

  end

  def new
    @destination = Destination.new
  end


  def create
    @destination = Destination.create(destination_params)
    if @destination.valid?
      flash[:notice] = "Destination created sucessfuly!"
      redirect_to destination_path(@destination)
    else
      flash[:errors] = @destination.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    @destination = Destination.update(destination_params)
    if @destination.valid?
      flash[:notice] = "Post created sucessfuly!"
      redirect_to destination_path(@destination)
    else
      flash[:errors] = @destination.errors.full_messages
      render :new
    end
  end

  def destroy
    @destination.destroy(destination_params)
    redirect_to destinations_path
  end



  private

  def find_params
    @destination = Destination.find(params[:id])
  end


  def destination_params
  params.require(:destination).permit(:name, :country)
  end


end
