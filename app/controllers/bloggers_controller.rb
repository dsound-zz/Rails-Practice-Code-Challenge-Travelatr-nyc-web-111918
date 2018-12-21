class BloggersController < ApplicationController
  before_action :find_params, only: [:show, :edit, :update, :destroy]

  def index
    @bloggers = Blogger.all
  end

  def show
    @destinations = Destination.all
  end


  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.create(blogger_params)
    if @blogger.valid?
      flash[:notice] = "Blogger succesfuly created!"
    redirect_to blogger_path(@blogger)
    else
      flash[:errors] = @blogger.errors.full_messages
      render :new
    end
  end

  def edit
  end


  def update
    @blogger = Blogger.update(blogger_params)
    if @blogger.valid?
      flash[:notice] = "Post created sucessfuly!"
      redirect_to blogger_path(@blogger)
    else
      flash[:errors] = @blogger.errors.full_messages
      render :new
    end
  end

  def destroy
    @blogger.destroy(blogger_params)
    redirect_to bloggers_path
  end


  private

  def find_params
    @blogger = Blogger.find(params[:id])
  end

  def blogger_params
  params.require(:blogger).permit(:name, :bio, :age)
  end


end
