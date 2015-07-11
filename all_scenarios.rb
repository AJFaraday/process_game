Dir["scenarios/**/*.rb"].each do |s|
  5.times{puts}
  puts s
  `ruby #{s}`
end
