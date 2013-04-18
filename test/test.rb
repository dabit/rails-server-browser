require 'test/unit'
require 'turn'
require 'net/http'

class TestServer < Test::Unit::TestCase
  def test_the_request
    uri = URI('http://127.0.0.1:9292')
    assert "Hello World", Net::HTTP.get(uri)
  end
end
