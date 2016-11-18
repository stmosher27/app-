def measure(x = 1)
    start = Time.now
    x.times { yield }
    (Time.now - start) / x
end