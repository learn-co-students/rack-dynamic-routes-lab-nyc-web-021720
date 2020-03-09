class Application
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            name = req.path.split("/items/").last #turn /songs/Sorry into Sorry
            if item =@@items.find{|i| i.name == name}
                resp.write item.price
            else 
                resp.status = 400
                resp.write "Item not found"
            end
        else
            resp.write "Route not found"
            resp.status = 404
        end

        resp.finish
    end

end
