class DeliveriesController < ApplicationController
  before_action :get_warehouse

  def index
  end

  def new
    @delivery = @warehouse.deliveries.new
    @products = Product.order(title: :asc)
  end

  def create
    @products = Product.order(title: :asc)

    params[:delivery].each do |params_delivery|
      current_product = @warehouse.product_warehouses.where(product_id: params_delivery[:product_id])
      params_delivery[:amount] = params_delivery[:amount].to_i + current_product.pick(:amount)
      if current_product
        @product_warehouse = current_product.update(amount: params_delivery[:amount])
      else
        @product_warehouse = current_product.create(amount: params_delivery[:amount])
      end
    end

    if @product_warehouse.each { |product_warehouse| product_warehouse.save }
      
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
    params.permit(:created_at, delivery: [:warehouse_id, :product_id, :amount]).require(:delivery)
  end
end
