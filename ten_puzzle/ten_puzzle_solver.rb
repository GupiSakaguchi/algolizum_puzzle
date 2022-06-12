require '../ten_puzzle/poland'

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

    p res
    p res.size
  end

  def all
    result = []

    (0..9).to_a.repeated_combination(4).to_a.each do |num|
      result << solve(num, 10)
    end

    p result.compact.size
    p result.compact
  end

  def solve(numbers, target)
    result = []
    # 4つの数字の並び順
    per = numbers.permutation.to_a
    per.each do |num|
      # 演算子のパターン
      operators = OPERATORS.repeated_permutation(3).to_a
      operators.each do |opt|
        # 逆ポーランドの5パターン
        # ××××○○○
        #poland = "#{num.join('')}#{opt.join((''))}"
        poland = (num + opt)

        res = Poland.new.calc(poland.join(''))
        result << poland.join('') if res == target

        # ×××○×○○
        poland.swap!(3,4)
        res = Poland.new.calc(poland.join(''))
        result << poland.join('') if res == target

        # ×××○○×○
        poland.swap!(4,5)
        res = Poland.new.calc(poland.join(''))
        result << poland.join('') if res == target

        # ×○××○×○
        poland.swap!(2,3)
        res = Poland.new.calc(poland.join(''))
        result << poland.join('') if res == target

        # ××○××○○
        poland.swap!(4,5)
        res = Poland.new.calc(poland.join(''))
        result << poland.join('') if res == target
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
  TenPuzzleSolver.new.main(ARGV[0], ARGV[1], ARGV[2], ARGV[3], ARGV[4])
else
  TenPuzzleSolver.new.all
end

