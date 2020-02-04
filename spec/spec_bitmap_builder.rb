require './lib/bitmap_builder.rb'


RSpec.describe BitmapBuilder do
    it 'Create matrix ' do
       
        
      expect{ create_matrix(2,2) }.to equal([["o","o"]["o","o"]]).to_stdout_from_any_process
    end

   


  end