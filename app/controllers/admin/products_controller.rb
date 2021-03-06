class Admin::ProductsController < Admin::AdminController
  before_action :set_admin_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to [:admin, @product], notice: 'Team member was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to [:admin, @product], notice: 'Team member was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to admin_team_members_url, notice: 'Team member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_admin_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.fetch(:product, {}).permit(:title, :description, :avatar, :price, :size, :other)
  end
end
