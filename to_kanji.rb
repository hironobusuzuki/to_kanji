class Integer
  def to_kanji
    fixnum_kanji = []
    self.reversed_numerical_array.each_with_index do |figure, digit|
      kanji = figure_table(digit)[figure]
      kanji += digit_table[digit] unless figure.zero?
      fixnum_kanji << kanji
    end
    fixnum_kanji.reverse.join("")
  end

protected
  def chars
    self.to_s.chars
  end

  def reversed_numerical_array
    self.chars.map(&:to_i).reverse
  end

  def figure_table(digit)
    {
      0=>""  , 1=>one_kanji(digit),
      2=>"二", 3=>"三",
      4=>"四", 5=>"五",
      6=>"六", 7=>"七",
      8=>"八", 9=>"九"
    }
  end

  def one_kanji(digit)
    (0..3).include?(digit) ? "" : "一"
  end

  def digit_table
    base_units   = ["", "十", "百", "千"]
    extend_units = ["", "万", "億", "兆", "京"]
    digit_table = extend_units.map do |eu|
                    base_units.map do |bu|
                      bu + eu
                    end
                  end
    digit_table.flatten
  end
end
