class BitmapEditor
     attr_accessor :matrix,:blankmatrix
     require './lib/bitmap_error_check.rb'
     require './lib/bitmap_builder.rb'
     include BitmapErrorCheck
     include BitmapBuilder

    def initialize
      @matrix = []
      @blankmatrix = []
    end
  

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.split(" ")
      case line.first()
      when 'I'
          self.matrix = create_matrix(line[1],line[2])
          self.blankmatrix = self.matrix
      when 'L'
           self.matrix = change_x_y_value(line[1],line[2],line[3],self.matrix)
      when 'H'
           self.matrix = change_x_value(line[1],line[2],line[3],line[4],self.matrix)
      when 'V'
           self.matrix = change_y_value(line[1],line[2],line[3],line[4],self.matrix)
      when 'C'
           self.matrix = self.blankmatrix
      when 'S'
           puts self.matrix.to_s
      else
           puts "Incorrect Entry!! Please choose from I, L, H, V, C or S"
      end
    end
  end

  

end
