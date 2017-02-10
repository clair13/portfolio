class PortsController < ApplicationController
  def index
    @port_items = Port.all
  end
end
