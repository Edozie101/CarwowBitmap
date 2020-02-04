module BitmapErrorCheck
    

    def assert_size_mismatch?(x,y,m)
        #  edgecase test and abort if incorrect - to create supx and supy
        if m.nil? or x.nil? or y.nil? or m[0].nil?
           abort("NilValue in your L function ")
        end
        supy = m.length 
        supx = m[0].length

        if (x > supx)
            raise ArgumentError.new("The X value is too large your L function ")
        elsif (y > supy)
            raise ArgumentError.new("The Y value is too large your L function ")
        else
        end 
    end

    def assert_size_xs_mismatch?(x1,x2,y,m)
        #  edgecase test and abort if incorrect - to create supx and supy
        if m.nil? or y.nil? or x2.nil? or x1.nil? or m[0].nil?
           abort("NilValue  in your H function")

        end
        supy = m.length 
        supx = m[0].length

        if (x2 > supx || x2 <= 0)
        raise ArgumentError.new("The X2 value is too large  in your H function ")
        elsif (x1 > supx || x1 > supx || x1 > x2 )
        raise ArgumentError.new("The X1 value is too large in your H function " )
        elsif (y > supy)
        raise ArgumentError.new("The Y value is too large in your H function ")
        else
        end 
    end

    def assert_size_ys_mismatch?(x,y1,y2,m)
        #  edgecase test and abort if incorrect - to create supx and supy

        if m.nil? or x.nil? or y2.nil? or y1.nil? or m[0].nil?
            abort("NilValue in your V function ")
        end

        supy = m.length 
        supx = m[0].length

        if (y2 > supy || y2 <= 0)
        raise ArgumentError.new("The Y2 value is too large in your V function ")
        elsif (y1 > supy || y1 > supy ||  y1 > y2)
        raise ArgumentError.new("The Y1 value is too large in your V function  ")
        elsif (x > supy)
        raise ArgumentError.new("The X value is too large in your V function  ")
        else
        end 
    end


    def assert_incorrect_barrier?(x,y)
        supy =  250
        supx =  250

        if (x > supx || x <= 0 )
        raise ArgumentError.new("The X value is out of bounds in your I function ")

        elsif (y > supy || y <= 0)
        raise ArgumentError.new("The Y value is out of bounds in your I function ")
        else
        end 
    end
end