require '../ten_puzzle/poland'
require 'pry'

class TenPuzzleSolver
  OPERATORS = ['+', '-', '*', '/']

  def main(num1, num2, num3, num4, target)
    # po = Poland.new
    numbers = []
    numbers << num1.to_i
    numbers << num2.to_i
    numbers << num3.to_i
    numbers << num4.to_i
    res = solve(numbers, target.to_i)

    p res.compact.flatten
    p res.compact.flatten.size
  end

  def all
    result = []

    (0..9).to_a.repeated_combination(4).to_a.each do |num|
      value = solve(num, 10)
      result << solve(num, 10) if value.size > 0
    end

    r = result.compact
    p r
    p r.size
  end

  def solve(numbers, target)
    result = []
    # 4つの数字の並び順
    per = numbers.permutation.to_a

    per.each do |num|
      poland = Poland.new

      # 演算子のパターン
      operators = OPERATORS.repeated_permutation(3).to_a
      operators.each do |opt|
        # 逆ポーランドの5パターン
        # ××××○○○
        poland_equation = num + opt

        res = poland.calc(poland_equation.join(''))
        result << poland_equation.join('') if res == target

        # ×××○×○○
        poland_equation.swap!(3,4)
        res = poland.calc(poland_equation.join(''))
        result << poland_equation.join('') if res == target

        # ×××○○×○
        poland_equation.swap!(4,5)
        res = poland.calc(poland_equation.join(''))
        result << poland_equation.join('') if res == target

        # ×○××○×○
        poland_equation.swap!(2,3)
        res = poland.calc(poland_equation.join(''))
        result << poland_equation.join('') if res == target

        # ××○××○○
        poland_equation.swap!(4,5)
        res = poland.calc(poland_equation.join(''))
        result << poland_equation.join('') if res == target
      end
    end

    result
  end
end

class Array
  def swap!(a, b)
    self[a], self[b] = self[b], self[a]
  end
end

if ARGV[0]
  #TenPuzzleSolver.new.main(ARGV[0], ARGV[1], ARGV[2], ARGV[3], ARGV[4])
  TenPuzzleSolver.new.main(3, 4, 7, 8, 10)
else
  TenPuzzleSolver.new.all
end

