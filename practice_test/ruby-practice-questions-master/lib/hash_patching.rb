class Hash

  # Write a version of my each that calls a proc on each key, value pair
  def my_each(&prc)
    keys.each do |k|
      prc.call(k, self[k])
    end
  end
  # Write a version of merge. This should NOT modify the original hash
  def my_merge(hash2)
    hash1 = dup
    hash2.each do |k, v|
      hash1[k] = v
    end
    hash1
  end

end
