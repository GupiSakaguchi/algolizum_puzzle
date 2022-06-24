require 'pry'

def search(pos, acc, &b)
  if pos > 7
    b.call(acc)
  else
    ['', '+', '-', '/', '*'].each do |op|
      binding.pry
      search(pos + 1, acc + [op], &b)
    end
  end
end

count = 0
search(0, []) do |pattern|
  binding.pry
  expr_base = [1, 2, 3, 4, 5, 6, 7, 8, 9].zip(pattern).flatten.compact.join.split(/\b/)
  expr = expr_base.map {|e| /^\d+$/ =~ e ? e.to_f : e }.join

  if eval(expr) == 100
    count += 1
    puts expr
  end
end

puts count
