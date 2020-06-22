class Bottles
  def verse(number)
    @current_bottles = grammar(number)
    @next_bottles = grammar(number - 1)
    @action = next_action(number)

    print_verse
  end

  private

  attr_reader :current_bottles, :next_bottles, :action

  def print_verse 
    <<-VERSE
#{print_first_line.capitalize}
#{print_second_line}
    VERSE
  end

  def print_first_line
    "#{current_bottles} of beer on the wall, #{current_bottles} of beer."
  end

  def print_second_line
    "#{action}, #{next_bottles} of beer on the wall."
  end

  def grammar(num)
    if num == 1
      "#{num} bottle"
    elsif num == 0
      "no more bottles"
    elsif num < 0
      "99 bottles"
    else  
      "#{num} bottles"
    end
  end

  def next_action(num)
    if num == 1
      "Take it down and pass it around"
    elsif num == 0
      "Go to the store and buy some more"
    else
      "Take one down and pass it around"
    end
  end

end