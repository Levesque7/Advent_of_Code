class Array

  def turn_on (x_start, x_end, y_start, y_end)
    (x_start..x_end).each do |x|
      (y_start..y_end).each do |y|
        self[x][y] = 1
      end
    end
  end

  def turn_off (x_start, x_end, y_start, y_end)
    (x_start..x_end).each do |x|
      (y_start..y_end).each do |y|
        self[x][y] = 0
      end
    end
  end

  def toggle (x_start, x_end, y_start, y_end)
    (x_start..x_end).each do |x|
      (y_start..y_end).each do |y|
        if self[x][y] == 0
          self[x][y] = 1
        else
          self[x][y] = 0
        end
      end
    end
  end

  def count_on
    @count = 0
    self.flatten.each do |v|
      if v == 1 then @count += 1 end
    end
    return @count
  end

  def turn_up (x_start, x_end, y_start, y_end)
    (x_start..x_end).each do |x|
      (y_start..y_end).each do |y|
        self[x][y] += 1
      end
    end
  end

  def turn_down (x_start, x_end, y_start, y_end)
    (x_start..x_end).each do |x|
      (y_start..y_end).each do |y|
        if self[x][y] > 0 then self[x][y] -= 1 end
      end
    end
  end

  def toggle_up (x_start, x_end, y_start, y_end)
    (x_start..x_end).each do |x|
      (y_start..y_end).each do |y|
        self[x][y] += 2
      end
    end
  end

  def brightness
    @bright = 0
    self.flatten.each do |v|
      @bright += v
    end
    return @bright
  end
  
end
