require 'nokogiri'
require 'open-uri'

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
      #@barcode = Barcode.find_by_code(barcode)
      search_for_barcode(barcode)
    end

    # Only allow a trusted parameter "white list" through.
    def barcode_params
      params.require(:barcode).permit(:code, :description, :manufacturer)
    end

    def search_for_barcode(barcode)
      uri = "https://duckduckgo.com/html/?q=#{barcode}+product&atb=v32-2b_&ia=web"
      doc = Nokogiri::HTML(open(uri))
      results = doc.xpath('//h2/a')
      barcode_result = nil
      unless results.empty?
        node = results[0] # get the first result
        p_info = extract_packaging_info(results)
        barcode_result = Barcode.new(:code => barcode, :description => node.text, :packaging_info => p_info)
        barcode_result.save!
      end
      barcode_result
    end

    def extract_packaging_info(dom)
      dom.each do
        # trawl through titles to find keywords
      end
      'TODO'
    end

end
