Carwow test focused on producing a bitmap represented as an M x N matrix of pixels with each element representing a colour.
![Alt Text](https://media.giphy.com/media/Uv0VUrAT6FtMQ/giphy.gif)
# Commands
* I M N - Create a new M x N image with all pixels coloured white (o).
* C - Clears the table, setting all pixels to white (o).
* V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 .
* H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 .
* L X Y C - Colours the pixel (X,Y) with colour C.
* S - Show the contents of the current image

# Running

`>bin/bitmap_editor examples/show.txt`

# Sample

<strong>Input: examples/showcopy.txt</strong>

I 5 6 <br>
L 1 3 A <br>
V 2 3 6 W <br>
H 3 5 2 Z <br>
S <br>

<strong>Output:</strong>

o o o o o <br>
o o Z Z Z <br>
A W o o o <br>
o W o o o <br>
o W o o o <br>
o W o o o <br>

# Test

`>rspec spec/spec_bitmap_editor.rb`

`>rspec spec/spec_bitmap_builder.rb`