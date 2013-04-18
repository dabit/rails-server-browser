$: << '.'

require 'eventmachine'
require 'thin'

module Server
  def receive_data(data)
    request = Thin::Request.new
    request.parse(data)
    puts request.env
  end
end

EventMachine.run do
  EventMachine.start_server "0.0.0.0", 9292, Server
end
