require 'open-uri'

class ProductsController < ApplicationController
  def index
  	products_json = open('http://lcboapi.com/products').read
  	@products = JSON.parse(products_json)
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
