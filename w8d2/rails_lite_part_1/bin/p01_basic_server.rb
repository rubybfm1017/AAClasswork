require 'rack'

# Rack::Server.start(
#     app: Proc.new do |env|
#       ['200', {'Content-Type' => 'text/html'}, ['Yo!!']]
#     end,
#     Port: 3000
#   )


app = Proc.new do |env|
    #path is a build-in rack method that contains the path
    req = Rack::Request.new(env)
    res = Rack::Response.new
    res['Content-Type'] = 'text/html'
    res.write(req.path)
    res.finish
  end


  Rack::Server.start(
    app: app,
    Port: 3000
  )