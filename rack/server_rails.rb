$: << '../rails/app'

require 'eventmachine'
require 'thin'
require 'config/environment'

module Server
  def receive_data(data)
    request = Thin::Request.new
    request.parse(data)

    app = Rails.application

    status, headers, body = app.call(request.env)

    response = "HTTP/1.1 #{status} OK\r\n"

    headers.each do |h,v|
      response << "#{h}: #{v}\r\n"
    end

    response << "\r\n"
    body.each do |b|
      response << "#{b}\r\n"
    end

    send_data response
    close_connection true
  end
end

EventMachine.run do
  EventMachine.start_server "0.0.0.0", 9292, Server
end
