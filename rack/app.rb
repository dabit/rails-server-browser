class App
  def call(env)
    content = "Hello World"
    status_code = 200
    headers = { "Content-Length" => content.length.to_s }
    [status_code, headers, [content]]
  end
end
