class TopicsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @topics = Topic.all
    @topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      redirect_to @topic, notice: "Topic saved successfully."
    else
      flash.now[:alert] = "Error creating topic. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "#{@topic.title} was deleted successfully."
      redirect_to topics_path
    else
      flash.now[:alert] = "There was an error deleting the topic."
      render :show
    end
  end


  private
  def topic_params
    params.require(:topic).permit(:title)
  end
end
