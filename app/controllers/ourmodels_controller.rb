class OurmodelsController < ApplicationController
  def index
    @ourmodels = Ourmodel.all

    render("ourmodels/index.html.erb")
  end

  def show
    @ourmodel = Ourmodel.find(params[:id])

    render("ourmodels/show.html.erb")
  end

  def new
    @ourmodel = Ourmodel.new

    render("ourmodels/new.html.erb")
  end

  def create
    @ourmodel = Ourmodel.new

    @ourmodel.model_weight = params[:model_weight]
    @ourmodel.ourmodel_name = params[:ourmodel_name]

    save_status = @ourmodel.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/ourmodels/new", "/create_ourmodel"
        redirect_to("/ourmodels")
      else
        redirect_back(:fallback_location => "/", :notice => "Ourmodel created successfully.")
      end
    else
      render("ourmodels/new.html.erb")
    end
  end

  def edit
    @ourmodel = Ourmodel.find(params[:id])

    render("ourmodels/edit.html.erb")
  end

  def update
    @ourmodel = Ourmodel.find(params[:id])

    @ourmodel.model_weight = params[:model_weight]
    @ourmodel.ourmodel_name = params[:ourmodel_name]

    save_status = @ourmodel.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/ourmodels/#{@ourmodel.id}/edit", "/update_ourmodel"
        redirect_to("/ourmodels/#{@ourmodel.id}", :notice => "Ourmodel updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Ourmodel updated successfully.")
      end
    else
      render("ourmodels/edit.html.erb")
    end
  end

  def destroy
    @ourmodel = Ourmodel.find(params[:id])

    @ourmodel.destroy

    if URI(request.referer).path == "/ourmodels/#{@ourmodel.id}"
      redirect_to("/", :notice => "Ourmodel deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Ourmodel deleted.")
    end
  end
end
