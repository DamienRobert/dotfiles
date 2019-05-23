#config.ru is wrapped inside Rack::Builder

class ShowConfig
  def self.call(env)
    [200, {'Content-Type' => 'text/plain'}, [env.inspect]]
  end
end

map "/map" do run ShowConfig end
run ShowConfig
#rackup --option config=map.ru
