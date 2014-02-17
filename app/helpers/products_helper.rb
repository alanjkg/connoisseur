module ProductsHelper
	def format_price(price_in_cents)
	    price_in_dollars = price_in_cents.to_f / 100
	    sprintf("$%.2f", price_in_dollars)
	end
end
