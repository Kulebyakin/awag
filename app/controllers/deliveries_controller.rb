class DeliveriesController < ApplicationController
  def index
    @deliveries = Delivery.where(warehouse_id: params[:warehouse_id]).order(created_at: :desc)
  end

  def new
    @delivery = Delivery.new
    @products = Product.order(title: :asc)
  end

  def create
    @products = Product.order(title: :asc)
    @delivery = Delivery.create(delivery_params)

    if @delivery[0].save
      redirect_to warehouse_deliveries_path, notice: "Delivery was successfully created."
    else
      render action: :new
    end
  end

  private

  def delivery_params
    params.permit(delivery: [:warehouse_id, :product_id, :amount]).require(:delivery)
  end
end
