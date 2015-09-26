class Integer
  MAX_NUMBER = 100000000000000000000
  DELIMINATE_DIGIT = 4

  #
  # = レシーバを数値の漢字に変換します。
  #
  # == Parameter
  #  :: なし
  #
  # == Return
  #  :: 変換された数値の漢字
  #
  def to_kanji
    if self >= MAX_NUMBER
      raise "このメソッドは#{MAX_NUMBER}以上には対応していません。"
    end

    fixnum_kanji = []
    reversed_numerics = self.numerical_array.reverse

    reversed_numerics.each_with_index do |figure, digit|
      kanji = figure_table_of(digit)[figure]
      unless figure.zero?
        kanji += base_digit_table[base_digit_table_index_of(digit)]
      end
      if deliminate_of?(digit)
        unless all_zero_numerics?(reversed_numerics[digit, DELIMINATE_DIGIT])
          kanji += extend_digit_table[extend_digit_table_index_of(digit)]
        end
      end
      fixnum_kanji << kanji
    end

    fixnum_kanji.reverse.join("")
  end

protected
  def base_digit_table_index_of(digit)
    digit % DELIMINATE_DIGIT
  end

  def extend_digit_table_index_of(digit)
    digit / DELIMINATE_DIGIT
  end

  def all_zero_numerics?(numerics)
    numerics.inject(:+).zero?
  end

  def deliminate_of?(digit)
    (digit % DELIMINATE_DIGIT).zero?
  end

  def chars
    self.to_s.chars
  end

  def numerical_array
    self.chars.map(&:to_i)
  end

  def figure_table_of(digit)
    {
      0=>""  , 1=>one_kanji_of(digit),
      2=>"二", 3=>"三",
      4=>"四", 5=>"五",
      6=>"六", 7=>"七",
      8=>"八", 9=>"九"
    }
  end

  def one_kanji_of(digit)
    deliminate_of?(digit) ? "一" : ""
  end

  def base_digit_table
    [ "", "十", "百", "千" ]
  end

  def extend_digit_table
    [ "", "万", "億", "兆", "京" ]
  end
end
