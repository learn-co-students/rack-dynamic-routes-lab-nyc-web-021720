class Application 
    @@items = []
    
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            #the following piece of code splits the path from /item/ and the item search itself 
            #and assigns it to item_name
            item_name = req.path.split("/items/").last 
            if item =@@items.find{|i| i.name == item_name}
                resp.write item.price
            else
                resp.status = 400
                resp.write "Item not found"
            end
        else 
            resp.status = 404
            resp.write "Route not found"
        end
        resp.finish
    end

end