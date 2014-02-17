require 'open-uri'

class ProductsController < ApplicationController
  def index
    page = params[:page] || 1
  	products_json = open('http://lcboapi.com/products?page=' + page.to_s).read
  	@products = JSON.parse(products_json)
    @page_number = @products["pager"]["current_page"] || 1
    @next_page = @products["pager"]["next_page"] || @page_number + 1
  end

  def show
  	json = JSON.parse(open("http://lcboapi.com/products/#{params[:id]}/inventories").read)
  	@product = json['product']
  	@stores = []
  	json['result'].each do |i|
  		json = JSON.parse(open("http://lcboapi.com/stores/#{i['store_id']}").read)
  			@stores << {'quantity' => i['quantity'], 'store' => json['result']}
  		end
  	end


  def new
  end

  def edit
  end
end
