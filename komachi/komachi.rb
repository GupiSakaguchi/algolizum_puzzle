# 1 □ 2 □ 3 □ 4 □ 5 □ 6 □ 7 □ 8 □ 9 □ = 100
# □をが+,-,x,/,空白の何れかを求めるロジック
class Komachi
  def main
    vector = []

    rec(vector)
  end

  # 1.空白処理
  # 2.掛け算・割り算
  # 3.加減
  def rec(vector)
    if vector.size == 8
      return
    end

    5.times do |operator|
      vector.push(operator)

      rec(vector2)

      vector.pop # 1手戻す
    end
  end

  def calc_empty(signs)
    new_vals = []
    new_signs = []

    value = 1
    signs.size.times do |i|
      add = i + 2

      if signs[i] == Sign::EMPTY
        value = value * 10 + add
      else
        new_vals.push(value)
        new_signs.push(signs[i])

        value = add
      end
    end

    new_vals.push(value)
    [new_vals, new_signs]
  end

  def calc_mul_div(vals, signs)
    new_vals = []
    new_signs = []

    value = vals.first

    # 演算子
    signs.size.times do |i|
      add = vals[i + 1]

      case signs[i]
      when Sign::MUL
        value = value * add
      when Sign::DIV
        value = value / add
      else
        new_vals.push(value)
        new_signs.pusu(signs[i])
        value = add
      end
    end

    new_vals.push(value) # 最後の値
    [new_vals, new_signs]
  end
end

module Sign
  EMPTY = 0
  PLUS = 1
  MINUS = 2
  MUL = 3
  DIV = 4
end

class Pair
end

k = Komachi.new

p k.calc_empty([1,0,0,3,4,2,2,0])
