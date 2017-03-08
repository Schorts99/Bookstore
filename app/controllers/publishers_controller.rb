class PublishersController < ApplicationController
  def new
    @page_title = 'Agregar editorial'
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save
      flash[:notice] = "Editorial agregada"
      redirect_to publishers_path
    else
      render 'new'
    end
  end

  def update
    @publisher = Publisher.find(params[:id])
    if @publisher.update(publisher_params)
      flash[:notice] = "Editorial actualizada"
      redirect_to publishers_path
    else
      render 'edit'
    end
  end

  def edit
    @publisher = Publisher.find(params[:id])
  end

  def destroy
    @publisher = Publisher.find(params[:id])
    if @publisher.destroy
      flash[:notice] = "Editorial removida"
      redirect_to publishers_path
    end
  end

  def index
    @publishers = Publisher.all
  end

  private
    def publisher_params
      params.require(:publisher).permit(:name)
    end
end
