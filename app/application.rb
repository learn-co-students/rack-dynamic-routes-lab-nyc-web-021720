require 'pry'

class Application

    def call(env)


         resp = Rack::Response.new
         req = Rack::Request.new(env)

         if req.path.match(/items/)

            last_item = req.path.split("/items/").last 
            item_name = @@items.find{|i| i.name == last_item}
            if item_name
                resp.write item_name.price

            else
                resp.status = 400
                resp.write "Item not found."
            end
        
         else
            resp.status = 404
            resp.write "Route not found"
         end

         resp.finish
    end
end