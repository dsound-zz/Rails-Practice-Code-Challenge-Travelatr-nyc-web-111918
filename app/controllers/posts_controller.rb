class PostsController < ApplicationController
  before_action :find_params, only: [:show, :edit, :update, :like, :destroy]

  def index
    @posts = Post.all
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.valid?
      flash[:notice] = "Post created sucessfuly!"
      redirect_to post_path(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end


  def edit

  end


  def edit
  end


  def like
    @post.likes.to_i
    @post.update(likes: @post.likes + 1)
    render :show
  end



  def update
    @post = Post.update(post_params)
    if @post.valid?
      flash[:notice] = "Post created sucessfuly!"
      redirect_to post_path(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end


  def destroy
    @post.destroy(post_params)
    redirect_to posts_path
  end



  private

  def find_params
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :likes, :destination, :blogger_id, :destination_id)
  end

end
