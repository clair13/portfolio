class PortsController < ApplicationController
  def index
    @port_items = Port.all
  end

  def angular
    @angular_port_items = Port.angular
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

  def show
    @port_item = Port.find(params[:id])
  end

  def destroy
    # Perform the lookup
    @port_item = Port.find(params[:id])

    # Destroy/delete the record
    @port_item.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to ports_url, notice: 'Record was removed.' }
    end
  end
end
