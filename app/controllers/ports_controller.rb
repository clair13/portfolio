class PortsController < ApplicationController
  before_action :set_port_item, only: [:edit, :show, :update, :destroy]
  layout 'port'
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all

  def index
    @port_items = Port.by_position
  end

  def sort
    params[:order].each do |key, value|
      Port.find(value[:id]).update(position: value[:position])
    end

    render nothing: true 
  end

  def angular
    @angular_port_items = Port.angular
  end

  def new
    @port_item = Port.new
    3.times { @port_item.technologies.build }
  end

  def create
    @port_item = Port.new(port_params)

    respond_to do |format|
      if @port_item.save
        format.html { redirect_to ports_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    
    respond_to do |format|
      if @port_item.update(port_params)
        format.html { redirect_to ports_path, notice: 'The record successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy
    # Perform the lookup

    # Destroy/delete the record
    @port_item.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to ports_url, notice: 'Record was removed.' }
    end
  end

  private

  def port_params
    params.require(:port).permit(:title,
                                 :subtitle,
                                 :body,
                                 :main_image,
                                 :thumb_image,
                                 technologies_attributes: [:name]
                                 )

  end

  def set_port_item
    @port_item = Port.find(params[:id])
  end
end
