class PortsController < ApplicationController
  def index
    @port_items = Port.all
  end

  def new
    @port_item = Port.new
  end

  def create
    @port_item = Port.new(params.require(:port).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @port_item.save
        format.html { redirect_to ports_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @port_item = Port.find(params[:id])
  end

  def update
    @port_item = Port.find(params[:id])
    
    respond_to do |format|
      if @port_item.update(params.require(:port).permit(:title, :subtitle, :body))
        format.html { redirect_to ports_path, notice: 'The record successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
end
