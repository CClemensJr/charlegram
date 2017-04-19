class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    if @post = Post.create(post_params)
      flash[:success] = "Your post was successfully uploaded!"
      redirect_to posts_path
    else
      flash.now[:alert] = "Your post could not be created! Please check the form."
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Your post was successfully update!"
      redirect_to posts_path
    else
      flash.now[:alert] = "Your post could not be updated! Please check the form."
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = "Your post was successfully deleted!"
      redirect_to posts_path
    else
      flash.now[:alert] = "Your post could not be deleted!"
    end
  end


  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
