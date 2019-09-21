class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
      item = req.params["item"]
        if @@items.include?(item)
          resp.write "#{item}"
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

# def handle_search(search_term)
#   if Item.include?(search_term)
#     adfad
#   else
#     ealf
#   end
# end
