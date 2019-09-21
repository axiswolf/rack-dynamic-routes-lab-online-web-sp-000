class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
        Item.each do |item|
          resp.write "#{Item.price}"
          resp.status = 200
        end
    # elsif req.path =="/items"
    #   resp.write "Item not found"
    #   resp.status = 404
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end

def handle_search(search_term)
  if Item.include?(search_term)
    adfad
  else
    ealf
  end
end