class Poland
  def calc(exp)
    space = []

    exp.chars do |char|
     number?(char) ? space.push(char.to_i) : operator_logic(char, space)
    end

    space.first
  end

  def number?(str)
    # 文字列の先頭(\A)から末尾(\z)までが「0」から「9」の文字か
    nil != (str =~ /\A[0-9]+\z/)
  end

  def operator_logic(char, space)
    second = space.pop
    first = space.pop

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
  end
end

po = Poland.new
p po.calc(ARGV[0])




