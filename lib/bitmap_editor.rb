class BitmapEditor
    attr_accessor :matrix,:blankmatrix
  
    def initialize
      @matrix = []
      @blankmatrix = []

    end
  

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.split(" ")
      case line.first()
      when 'S'
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
      when 'I'
         puts  "There is an I"
      else
          puts line.to_s 
      end
    end
  end

  def create_matrix(x,y,m=[]) 
      x = x.to_i
      y = y.to_i
      matrix = m
      r=0
      y.times do
        matrix.push([])
        x.times do
          matrix[r].push("w")
        end
        r +=1
      end
      return matrix
  end

  def change_x_y_value(x,y,colour,m)
    x = x.to_i
    y = y.to_i
     matrix = m     
     matrix[y-1][x-1] = colour
     return matrix

  end


  def change_y_value(x,y1,y2, colour,m)
    x = x.to_i
    y1 = y1.to_i
    y2 = y2.to_i
    matrix = m
    (y1...y2).each do |n|
      matrix[n-1][x-1] = colour
    end
    return matrix
  end

  def change_x_value(x1,x2,y, colour, m)
    y = y.to_i
    x1 = x1.to_i
    x2 = x2.to_i
    matrix = m
    (x1..x2).each do |n|
        matrix[y-1][n-1] = colour
    end
    return matrix
  end

  def assert_size_mismatch?(x,y,m)
      supy = m.length 
      supx = m[0].length

      if (x > supx)

      elsif (y > sup y)

      else
        puts "Size is all good"
      end 
  end
end
