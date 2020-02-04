module BitmapBuilder

  # Assert functions are defined in the bitmap error check file
  
  def create_matrix(x,y,m=[]) 
      matrix = m
      begin
        # Validate Values before building to gracefully fail if an error exists
        assert_incorrect_barrier?(x,y)
      rescue  ArgumentError => e
        abort("Houston we have a problem " + e.message)
      end
        r=0
        y.times do
          matrix.push([])
          x.times do
            matrix[r].push("o")
          end
          r +=1
        end
        return matrix
      
  end

  def change_x_y_value(x,y,colour,m)
    matrix = m  
    begin
        # Validate Values before building to gracefully fail if an error exists

      assert_size_mismatch?(x,y,m)
    rescue  ArgumentError => e
       abort("Houston we have a problem " + e.message)
    end
   
      matrix[y-1][x-1] = colour
      return matrix
    

  end


  def change_y_value(x,y1,y2, colour,m)
    matrix = m
    begin
      # Validate Values before building to gracefully fail if an error exists

      assert_size_ys_mismatch?(x,y1,y2,matrix)
    rescue  ArgumentError => e
       abort("Houston we have a problem " + e.message)
    end
    (y1..y2).each do |n|
      matrix[n-1][x-1] = colour
    end
    return matrix

  end

  def change_x_value(x1,x2,y, colour, m)
    matrix = m
    begin
      # Validate Values before building to gracefully fail if an error exists
      assert_size_xs_mismatch?(x1,x2,y,m)
    rescue ArgumentError => e
        err = e
        abort("Huston we have a problem " + e.message)
    end
    (x1..x2).each do |n|
        matrix[y-1][n-1] = colour
    end
    return matrix
  end

  def print_matrix(m)
    m.each do |line|
        print(line.join(" "))
        puts "\n"
    end

  end

  

end
