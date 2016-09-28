s = gets
t = ''

while s.length > 0
  if s <= s.reverse
    t += s[0]
    s = s[1..-1]
  else
    t += s[-1]
    s = s[0..-2]
  end
end

puts t
