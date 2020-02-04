class BitmapEditor
    attr_accessor :matrix,:blankmatrix,:error
  
    def initialize
      @matrix = []
      @blankmatrix = []
      

    end
  

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      errorcheck(matrix)
      line = line.split(" ")
      case line.first()
      when 'I'
          self.matrix = create_matrix(line[1],line[2])
          self.blankmatrix = self.matrix
          puts self.matrix.to_s
      when 'L'
           self.matrix = change_x_y_value(line[1],line[2],line[3],self.matrix)
           puts self.matrix.to_s
      when 'H'
           self.matrix = change_x_value(line[1],line[2],line[3],line[4],self.matrix)
           puts self.matrix.to_s
      when 'V'
           self.matrix = change_y_value(line[1],line[2],line[3],line[4],self.matrix)
           puts self.matrix.to_s
      when 'C'
          self.matrix = self.blankmatrix
      when 'S'
           puts self.matrix.to_s
      else
          puts line.to_s 
      end
    end
  end

  def create_matrix(x,y,m=[]) 
      x = x.to_i  
      y = y.to_i
      matrix = m
      err = nil
      begin
        assert_incorrect_barrier?(x,y)
      rescue  ArgumentError => e
         err = e.message
         puts e.message()
      end
      if err.nil?
        r=0
        y.times do
          matrix.push([])
          x.times do
            matrix[r].push("o")
          end
          r +=1
        end
        return matrix
      else
        return e
    
      end
  end

  def change_x_y_value(x,y,colour,m)
    x = x.to_i
    y = y.to_i
    matrix = m  
    err = nil
    begin
      puts "changing xy"
      puts matrix.class
      assert_size_mismatch?(x,y,m)
    rescue  ArgumentError => e
       err = e
       puts e.message()
    end
     if err.nil?
   
      matrix[y-1][x-1] = colour
      return matrix
     else 
      return err
     end

  end


  def change_y_value(x,y1,y2, colour,m)
    x = x.to_i
    y1 = y1.to_i
    y2 = y2.to_i
    matrix = m
    err = nil
    begin
      puts "change y value func"
      puts matrix.class
      assert_size_ys_mismatch?(x,y1,y2,matrix)
    rescue  ArgumentError => e
      err = e
       puts e.message()
    end

    if err.nil?
      (y1..y2).each do |n|
        matrix[n-1][x-1] = colour
      end
      return matrix
    else 
      return err
    end
  end

  def change_x_value(x1,x2,y, colour, m)
    y = y.to_i
    x1 = x1.to_i
    x2 = x2.to_i
    matrix = m
    err = nil
    begin
      puts "in x change value"
      assert_size_xs_mismatch?(x1,x2,y,m)
    rescue ArgumentError => e
        err = e
        puts e.message
    end
    if err.nil?
      (x1..x2).each do |n|
          matrix[y-1][n-1] = colour
      end
      return matrix
    else 
      return e
    end
  end

  def assert_size_mismatch?(x,y,m)
      supy = m.length 
      supx = m[0].length
      if m.nil? or x.nil? or y.nil? 
        raise ArgumentError.new("NilValue ")

      end
     

      if (x > supx)
        raise ArgumentError.new("The X value is too large ")
      elsif (y > supy)
         raise ArgumentError.new("The Y value is too large ")
      else
        puts "Size is all good xy"
      end 
  end

  def assert_size_xs_mismatch?(x1,x2,y,m)
    supy = m.length 
    supx = m[0].length

    if (x2 > supx || x2 <= 0)
      raise ArgumentError.new("The X2 value is too large ")
    elsif (x1 > supx || x1 > supx || x1 > x2 )
      raise ArgumentError.new("The X1 value is too large")
    elsif (y > supy)
       raise ArgumentError.new("The Y value is too large ")
    else
      puts "Size is all good X"
    end 
  end

  def assert_size_ys_mismatch?(x,y1,y2,m)
    puts "y mismatch" 
    puts m.length

    supy = m.length 
    supx = m[0].length

    if (y2 > supy || y2 <= 0)
      raise ArgumentError.new("The Y2 value is too large ")
    elsif (y1 > supy || y1 > supy ||  y1 > y2)
      raise ArgumentError.new("The Y1 value is too large ")
    elsif (x > supy)
       raise ArgumentError.new("The X value is too large ")
    else
      puts "Size is all good Y "
    end 
  end


  def assert_incorrect_barrier?(x,y)
    supy =  250
    supx =  250

    if (x > supx || x <= 0 )
      raise ArgumentError.new("The X value is out of bounds")

    elsif (y > supy || y <= 0)
       raise ArgumentError.new("The Y value is out of bounds ")
    else
      puts "Size is all good create"
    end 
  end

  def errorcheck(e)
      if e.class == ArgumentError
         abort("Huston we have a problem " + e.message)
      end
  end
end
