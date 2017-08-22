class SourcesController < ApplicationController
  def index
    @q = Source.ransack(params[:q])
    @sources = @q.result(:distinct => true).includes(:indicator, :author).page(params[:page]).per(10)

    render("sources/index.html.erb")
  end

  def show
    @source = Source.find(params[:id])

    render("sources/show.html.erb")
  end

  def new
    @source = Source.new

    render("sources/new.html.erb")
  end

  def create
    @source = Source.new

    @source.author_id = params[:author_id]
    @source.name = params[:name]
    @source.url = params[:url]
    @source.indicator_id = params[:indicator_id]

    save_status = @source.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/sources/new", "/create_source"
        redirect_to("/sources")
      else
        redirect_back(:fallback_location => "/", :notice => "Source created successfully.")
      end
    else
      render("sources/new.html.erb")
    end
  end

  def edit
    @source = Source.find(params[:id])

    render("sources/edit.html.erb")
  end

  def update
    @source = Source.find(params[:id])

    @source.author_id = params[:author_id]
    @source.name = params[:name]
    @source.url = params[:url]
    @source.indicator_id = params[:indicator_id]

    save_status = @source.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/sources/#{@source.id}/edit", "/update_source"
        redirect_to("/sources/#{@source.id}", :notice => "Source updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Source updated successfully.")
      end
    else
      render("sources/edit.html.erb")
    end
  end

  def destroy
    @source = Source.find(params[:id])

    @source.destroy

    if URI(request.referer).path == "/sources/#{@source.id}"
      redirect_to("/", :notice => "Source deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Source deleted.")
    end
  end
end
