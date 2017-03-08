class AuthorsController < ApplicationController
  def new
    @page_title = 'Agregar autor'
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:notice] = "Autor agregado"
      redirect_to authors_path
    else
      render 'new'
    end
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      flash[:notice] = "Autor actualizado"
      redirect_to authors_path
    else
      render 'edit'
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def destroy
    @author = Author.find(params[:id])
    if @author.destroy
      flash[:notice] = "Autor removido"
      redirect_to authors_path
    end
  end

  def index
    @authors = Author.all
  end

  private
    def author_params
      params.require(:author).permit(:first_name, :last_name)
    end
end
