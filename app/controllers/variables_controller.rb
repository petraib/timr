class VariablesController < ApplicationController
  def index
    @variables = Variable.all

    render("variables/index.html.erb")
  end

  def show
    @variable = Variable.find(params[:id])

    render("variables/show.html.erb")
  end

  def new
    @variable = Variable.new

    render("variables/new.html.erb")
  end

  def create
    @variable = Variable.new

    @variable.indicator_id = params[:indicator_id]
    @variable.model_id = params[:model_id]
    @variable.weight = params[:weight]
    @variable.ourmodel_id = params[:ourmodel_id]

    save_status = @variable.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/variables/new", "/create_variable"
        redirect_to("/variables")
      else
        redirect_back(:fallback_location => "/", :notice => "Variable created successfully.")
      end
    else
      render("variables/new.html.erb")
    end
  end

  def edit
    @variable = Variable.find(params[:id])

    render("variables/edit.html.erb")
  end

  def update
    @variable = Variable.find(params[:id])

    @variable.indicator_id = params[:indicator_id]
    @variable.model_id = params[:model_id]
    @variable.weight = params[:weight]
    @variable.ourmodel_id = params[:ourmodel_id]

    save_status = @variable.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/variables/#{@variable.id}/edit", "/update_variable"
        redirect_to("/variables/#{@variable.id}", :notice => "Variable updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Variable updated successfully.")
      end
    else
      render("variables/edit.html.erb")
    end
  end

  def destroy
    @variable = Variable.find(params[:id])

    @variable.destroy

    if URI(request.referer).path == "/variables/#{@variable.id}"
      redirect_to("/", :notice => "Variable deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Variable deleted.")
    end
  end
end
