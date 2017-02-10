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
end
