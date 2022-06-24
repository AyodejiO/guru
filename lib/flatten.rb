def flatten_array(array)
  if !array.is_a?(Array)
    return [array] # or could raise an exception
  end

  output = []

  while array.length > 0
    first = array.shift()
    if first.is_a?(Array)
      array.concat(first)
    else
      output << first
    end
  end
  output
end