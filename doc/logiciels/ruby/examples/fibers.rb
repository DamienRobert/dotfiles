fiber1 = Fiber.new do |f|
  puts "In Fiber 1"
  f.transfer
end

fiber2 = Fiber.new do
  puts "In Fiber 2"
  fiber1.transfer(fiber2)
  puts "Back in fiber2"
end

fiber2.resume
