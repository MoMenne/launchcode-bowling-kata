
class Bowl

  def initialize
    @frames = [Frame.new]
  end

  def roll(pins)
    if @frames.last.accept_roll?
      @frames.last.roll(pins)
    else
      @frames << Frame.new(pins)
    end

  end

  def score
    #@frames.inject(0) {|sum, x| sum + x.score}
    points = 0
    @frames.each_with_index do |f, i|
      points += f.score
      previous_frame = @frames[i - 1]
      next_frame = @frames[i+1]
      if @frames.length > 1 && i != 0
        if previous_frame.is_strike?
          points += f.first_roll_score + (f.second_roll_score || next_frame.first_roll_score)
        elsif previous_frame.is_spare?
          points += f.first_roll_score
        end
      end
    end
    points
  end
end

class Frame
  def initialize(pins = nil)
    @rolls = []
    @rolls << pins if pins
  end

  def accept_roll?
    case @rolls.length
    when 0; true
    when 1; !is_strike?;
    else false
    end
  end

  def is_spare?
    score == 10
  end

  def is_strike?
    score == 10 && @rolls.length == 1
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    @rolls.inject(0) {|sum, x| sum + x}
  end

  def first_roll_score
    @rolls[0]
  end

  def second_roll_score
    @rolls[1]
  end
end
