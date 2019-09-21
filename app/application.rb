class Application
  @@items = [Item.new("Apples", 3.34)]
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      # @@items.each do |item|
      #   resp.write "#{item}\n"
      # end
      # item = req.params["item"]
      #   if @@items.include?(item)
      #     resp.write "#{item[1]}"
            item_match = req.path.split("/items/").last
            item = @@items.find{|i| i.name == item_match}
          if item_match.include?(item)
            resp.write "#{item.price}"
            resp.status = 200
          else
            resp.write "Item not found"
            resp.status = 400
        end
      else
        resp.write "Route not found"
        resp.status = 404
      end
      resp.finish
    end
end
