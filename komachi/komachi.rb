class Komachi
  def main
    vector = []

    rec(vector)
  end

  private

  def rec(vector)
    if vector.size == 8

      return
    end

    5.times do |operator|
      vector2 = vector # 配列のcopy

      vector2.push(operator)

      rec(vector2)
    end
  end
end
