def time_it
  time_before = Time.now
  # do something (this is not for you to decide, just YIELD)
  yield
  # perfect...
  time_after = Time.now

  puts "it took #{time_after - time_before} seconds."
end

time_it { sleep(3) }

time_it { 'hello world' }