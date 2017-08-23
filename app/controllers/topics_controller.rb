class TopicsController < ApplicationController

  before_action :set_topic, except: [:index, :new, :create]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @topics = Topic.all
    @topic = Topic.new

  end

  def show
    authorize @topic
  end

  def new
    @topic = Topic.new

    authorize @topic
  end

  def create
    @topic = current_user.topics.new(topic_params)

    authorize @topic

    if @topic.save
      redirect_to @topic, notice: "Topic saved successfully."
    else
      flash.now[:alert] = "Error creating topic. Please try again."
      render :new
    end
  end

  def edit
    authorize @topic
  end

  def update
    authorize @topic
  end

  def destroy
    authorize @topic
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

  def set_topic
    @topic = Topic.find(params[:id])
  end
end
