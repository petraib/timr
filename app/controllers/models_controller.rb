class ModelsController < ApplicationController
  def index
    @models = Model.all

    render("models/index.html.erb")
  end

  def show
    @model = Model.find(params[:id])

    render("models/show.html.erb")
  end

  def new
    @model = Model.new

    render("models/new.html.erb")
  end

  def create
    @model = Model.new

    @model.user_id = params[:user_id]

    save_status = @model.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/models/new", "/create_model"
        redirect_to("/models")
      else
        redirect_back(:fallback_location => "/", :notice => "Model created successfully.")
      end
    else
      render("models/new.html.erb")
    end
  end

  def edit
    @model = Model.find(params[:id])

    render("models/edit.html.erb")
  end

  def update
    @model = Model.find(params[:id])

    @model.user_id = params[:user_id]

    save_status = @model.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/models/#{@model.id}/edit", "/update_model"
        redirect_to("/models/#{@model.id}", :notice => "Model updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Model updated successfully.")
      end
    else
      render("models/edit.html.erb")
    end
  end

  def destroy
    @model = Model.find(params[:id])

    @model.destroy

    if URI(request.referer).path == "/models/#{@model.id}"
      redirect_to("/", :notice => "Model deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Model deleted.")
    end
  end
end
