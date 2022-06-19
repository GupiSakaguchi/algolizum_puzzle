# 1 □ 2 □ 3 □ 4 □ 5 □ 6 □ 7 □ 8 □ 9 □ = TARGET
# □をが+,-,x,/,空白の何れかを求めるロジック

require 'pry'

class Komachi
  TARGET = 100

  def main
    vector = []
    result = []

    rec(vector, result)
    p result.uniq
    p result.uniq.size
  end

  # 1.空白処理
  # 2.掛け算・割り算
  # 3.加減
  def rec(vector, result)
    if vector.size == 8
      eps = 0.000_000_000

      r = (calc(vector) - TARGET).abs

      if r == eps.to_f
        result.push("#{decode(vector)}=#{calc(vector)}")
      end

      return
    end

    5.times do |i|
      vector.push(i)
      rec(vector, result)
      vector.pop # 1手戻す

      # vector2 = vector
      # vector2.push(i)
      #rec(vector2, result)
    end
  end

  def calc(signs)
    result = calc_empty(signs)

    result = calc_mul_div(result.first, result.last)

    calc_plus_minus(result.first, result.last)
  end

  def calc_empty(signs)
    new_vals = []
    new_signs = []

    value = 1
    signs.each_index do |i|
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

    value = vals.first.to_f

    # 演算子
    signs.each_index do |i|
      add = vals[i + 1].to_f

      case signs[i]
      when Sign::MUL
        value = value * add
      when Sign::DIV
        value = value / add
      else
        new_vals.push(value)
        new_signs.push(signs[i])
        value = add
      end
    end

    new_vals.push(value) # 最後の値
    [new_vals, new_signs]
  end

  def calc_plus_minus(vals, signs)
    result = vals[0]

    signs.each_index do |i|
      add = vals[i + 1].to_f

      case signs[i]
      when Sign::PLUS
        result = result + add
      when Sign::MINUS
        result = result - add
      end
    end

    result
  end

  def decode(signs)
    result = '1'

    signs.each_index do |i|
      case signs[i]
      when Sign::PLUS
        result = result + "+"
      when Sign::MINUS
        result = result + "-"
      when Sign::MUL
        result = result + "x"
      when Sign::DIV
        result = result + "/"
      end

      result = result + (i + 2).to_s
    end

    result
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

p Komachi.new.main

#p k.calc_empty([0,0,0,0,0,0,0,0])
