require '../ten_puzzle/poland'

class TenPuzzleSolver
  po = Poland.new
  p po.calc(ARGV[0])
  p po.decode(ARGV[0])
end
