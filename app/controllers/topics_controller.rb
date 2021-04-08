class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  

  # NEW TOPIC PAGE
  def new
    # @variable = Model.function
    @topic = Topic.new
  end

  # SAVE BUTTON
  def create
    # @variable (used in VIEW) = Model.new(SAVE TITLE, DESCRIPTION in TABLE)
    @topic = Topic.new(topic_params)

    # @variable.save means you are saving the variable
    if @topic.save # if successful save
      # go to SHOW PAGE
      redirect_to @topic
    else # if failed, wrong title
      render 'new'
      # go back to NEW PAGE
    end

    # IF SUCCESSFUL SAVE, go to ROOT PATH (which is INDEX)
    # redirect_to root_url -> INDEX PAGE
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])

    if @topic.update(topic_params)
      redirect_to @topic
    else
      render 'edit'
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy

    redirect_to root_url
  end

  # clean your code
  def topic_params
    params.require(:topic).permit(:title, :description)
  end
end
