class DeliveriesController < ApplicationController
  before_action :get_warehouse

  def index
    @deliveries = @warehouse.deliveries.order(created_at: :desc)
  end

  def new
    @delivery = @warehouse.deliveries.new
    @products = Product.order(title: :asc)
  end

  def create
    @products = Product.order(title: :asc)
    @delivery = @warehouse.deliveries.create(delivery_params)

    if @delivery.each { |delivery| delivery.save }
      redirect_to warehouse_deliveries_path, notice: "Delivery was successfully created."
    else
      render action: :new
    end
  end

  private

  def get_warehouse
    @warehouse = Warehouse.find(params[:warehouse_id])
  end

  def delivery_params
    params.permit(delivery: [:warehouse_id, :product_id, :amount]).require(:delivery)
  end
end
