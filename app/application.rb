class Application

    def call(env)
        resp = Rack::Response.new
        request = Rack::Request.new(env)

        if request.path.match("/items/")
            item_request = request.path.split("/items/").last
            if item = @@items.find{|item| item.name == item_request}
                resp.write item.price
            else 
            resp.status = 400
            resp.write "Item not found"
            end
        else 
            resp.status = 404
            resp.write  "Route not found"
        end
        resp.finish
    end
end