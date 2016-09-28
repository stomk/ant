in_file = ARGV[0]
xs = []
range = 0

File.open(in_file) do |f|
  range = f.gets.chomp.to_i.freeze
  while line = f.gets
    xs.push(line.chomp.to_i)
  end
end


xs.sort!
marks = []
prev_mark = -(range + 1)
isolated_head = nil
(0..xs.length-1).each do |i|
  this_x = xs[i]
  if this_x > prev_mark + range
    next_x = i < xs.length - 1 ? xs[i+1] : this_x + range + 1
    isolated_head ||= this_x
    if next_x > isolated_head + range
      marks.push(this_x)
      prev_mark = this_x
      isolated_head = nil
    end
  end
end


p marks
