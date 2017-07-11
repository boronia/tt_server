class BarcodesController < ApplicationController
  before_action :set_barcode, only: [:show, :update, :destroy]

  # GET /barcodes
  def index
    @barcodes = Barcode.all

    render json: @barcodes
  end

  # GET /barcodes/1
  def show
    render json: @barcode
  end

  # POST /barcodes
  def create
    @barcode = Barcode.new(barcode_params)

    if @barcode.save
      render json: @barcode, status: :created, location: @barcode
    else
      render json: @barcode.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /barcodes/1
  def update
    if @barcode.update(barcode_params)
      render json: @barcode
    else
      render json: @barcode.errors, status: :unprocessable_entity
    end
  end

  # DELETE /barcodes/1
  def destroy
    @barcode.destroy
  end

  def search
    render json: find_barcode(params[:barcode])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barcode
      @barcode = Barcode.find(params[:id])
    end

    def find_barcode(barcode)
      @barcode = Barcode.find_by_code(barcode)
    end

    # Only allow a trusted parameter "white list" through.
    def barcode_params
      params.require(:barcode).permit(:code, :description, :manufacturer)
    end
end
