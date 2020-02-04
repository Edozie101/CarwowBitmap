require './lib/bitmap_editor.rb'


RSpec.describe BitmapEditor do
    it 'Creates an appropriate image of a correct I line ' do
       a = File.open("./spec/examples/testI.txt", 'w') do |file|
        file.write("I 5 6\nS")
       end
        
      expect{ system('bin/bitmap_editor spec/examples/testI.txt') }.to output("o o o o o\no o o o o\no o o o o\no o o o o\no o o o o\no o o o o\n").to_stdout_from_any_process
    end

    it 'Doesn\'t output anything when there is no S at the bottom ' do
        a = File.open("./spec/examples/testnS.txt", 'w') do |file|
          file.write("I 5 6\n")
        end
        expect{ system('bin/bitmap_editor spec/examples/testnS.txt') }.to output("").to_stdout_from_any_process
      end
    it ' Correctly Accomplishes the Carwow challenge' do
        File.open("./spec/examples/carwow.txt", "w" ) do |file|
           file.write("I 5 6\nL 1 3 A\nV 2 3 6 W\nH 3 5 2 Z\nS")
        end

        expect { system ('bin/bitmap_editor spec/examples/carwow.txt')}.to output("o o o o o\no o Z Z Z\nA W o o o\no W o o o\no W o o o\no W o o o\n").to_stdout_from_any_process
   end
  end