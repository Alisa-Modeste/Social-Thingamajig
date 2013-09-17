class PostsController < ApplicationController
  def new
    render :new
  end

  def create
    Post.transaction do
      @post = Post.new(params[:post])
      @post.author_id = current_user.id
      @post.save

      @links = params[:links]
      @links.reject! {|s| s == nil || s == "" }

      @links.each do |link|
        l = Link.new(url: link)
        l.post_id = @post.id
        l.save!
      end
    end

    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

end
