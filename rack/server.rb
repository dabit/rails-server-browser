$: << '.'

require 'eventmachine'
require 'thin'
require 'app'

module Server
  def receive_data(data)
    request = Thin::Request.new
    request.parse(data)

    app = App.new

    status, headers, body = app.call(request.env)

    puts headers
    puts body
  end
end

EventMachine.run do
  EventMachine.start_server "0.0.0.0", 9292, Server
end
