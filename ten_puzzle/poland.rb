class Poland
  def calc(exp)
    space = []

    exp.chars do |char|
      if number?(char)
        space.push(char.to_i)
      else
        operator_logic(char, space)
      end
    end

    space.first
  end

  def decode(exp)
    space = []

    exp.chars do |char|
      if number?(char)
        space.push(char)
      else
        decode_operator_logic(char, space)
      end
    end

    space.first
  end

  private

  def number?(str)
    # 文字列の先頭(\A)から末尾(\z)までが「0」から「9」の文字か
    nil != (str =~ /\A[0-9]+\z/)
  end

  def operator_logic(char, space)
    second = space.pop
    first = space.pop

    return 0 if first.nil? || second.nil?

    case char
    when '+'
      space.push(first + second)
    when '-'
      space.push(first - second)
    when '*'
      space.push(first * second)
    else
      space.push(first / second)
    end
  rescue ZeroDivisionError
    0
  end

  def decode_operator_logic(char, space)
    second = space.pop
    first = space.pop

    case char
    when '*', '/'
      if first.size > 1
        first = "(#{first})"
      end

      if second.size > 1
        second = "(#{second})"
      end
    end

    case char
    when '+'
      space.push("#{first} + #{second}")
    when '-'
      space.push("#{first} - #{second}")
    when '*'
      space.push("#{first} * #{second}")
    else
      space.push("#{first} / #{second}")
    end
  end
end

# po = Poland.new
# p po.calc(ARGV[0])
# p po.decode(ARGV[0])




