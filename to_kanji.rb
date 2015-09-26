class Fixnum
  def to_kanji
    [].tap do |kanji|
      self.to_s.split("").map(&:to_i)
                       .reverse.each_with_index do |figure, digit|
        kanji << (figure.zero? ? figure_table(digit)[figure] : figure_table(digit)[figure]+digit_table[digit])
      end
      kanji.reverse.join("")
    end
  end

  private
    def figure_table(digit)
      {
        0=>"",   1=>(digit == 0 ? "一" : ""), 2=>"二", 3=>"三",
        4=>"四", 5=>"五", 6=>"六", 7=>"七",
        8=>"八", 9=>"九"
      }
    end

    def digit_table()
      base_unit     = ["", "十", "百", "千"]
      ["", "万", "億", "兆", "京"].map do |elem|
      end
=begin
      [
        "", "十", "百", "千", "万", "十万", "百万", "千万",
        "億", "十億", "千億", "兆", "十兆", "百兆", "千兆",
        "京", "十京", "百京", "千京"
      ]
=end
    end
end
