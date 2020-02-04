require './lib/bitmap_editor.rb'


RSpec.describe BitmapBuilder do
  it 'Cannot accept a nil value' do 
    expect{BitmapEditor.new().create_matrix(4)}.to raise_error(ArgumentError)

  end
    it 'Creates 2 by 2 matrix ' do
      expect( BitmapEditor.new().create_matrix(2,2) ).to eq([["o", "o"], ["o", "o"]])
    end

    it 'Cannot create 251 by 250 matrix ' do
      expect( BitmapEditor.new().create_matrix(251,250) ).to output(".Houston we have a problem The X value is out of bounds in your I function ")
    end

    it 'Cannot create 250 by 251 matrix ' do
      expect( BitmapEditor.new().create_matrix(250,251) ).to output(".Houston we have a problem The Y value is out of bounds in your I function ")
    end

  


  end