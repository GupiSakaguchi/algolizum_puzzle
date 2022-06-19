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
      vector.push(operator)

      rec(vector2)

      vector.pop
    end
  end
end
