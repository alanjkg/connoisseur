class StoresController < ApplicationController

  def index
    stores_json=open('http://lcboapi.com/stores')
    storeread=stores_json.read
    @stores=JSON.parse(storeread)
  end

  def show
    stores_json = open('http://lcboapi.com/stores/' + "#{params[:id]}")
    storeread=stores_json.read
    @store=JSON.parse(storeread)
    end
end

