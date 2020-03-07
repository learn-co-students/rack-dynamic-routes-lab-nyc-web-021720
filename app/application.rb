require "rack"
require_relative "./item.rb"

class Application

    @@items = []

    def call(env)
        req = Rack::Request.new(env)
        resp = Rack::Response.new

        if req.path.match(/items/) then
            run_item_request(req, resp)
        else
            resp.write("Route not found")
            resp.status = 404
        end

        resp.finish
    end

    def run_item_request(req, resp)
        query = req.path.gsub("/items/", "")

        item = @@items.find {|i| i.name == query}
        if item then
            resp.write(item.price)
        else
            resp.write("Item not found")
            resp.status = 400
        end
    end
end