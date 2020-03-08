class Application
    @@items = []

    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
   
      if req.path.match (/items/) #name of path CONDITION 1
        item_name = req.path.split("/items/").last #name of item from URL
        if item = @@items.find {|obj| obj.name == item_name} #One instance with item_name CONDTITION 1.1
            resp.write item.price 
        else                                        #CONDITION 1.2
            resp.write "Item not found"
            resp.status = 400
        end 
      else                          # CONDITION 2 
        resp.write "Route not found"
        resp.status = 404
      end
   
      resp.finish
    
    
    end
  

end