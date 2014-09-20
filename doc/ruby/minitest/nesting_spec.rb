require "minitest/autorun"
class Thingy
  attr_accessor :a,:b
end
ploum=Thingy.new

describe Thingy do                     
  before do                            
    ploum.a="this is ploum"
    puts ploum.a
  end                                  

  after do
    puts "outer after"
  end
                                       
  it "should do the first thing" do    
    puts "first test"
    1.must_equal 1                     
  end                                  
                                       
  describe Thingy do                
    before do                          
      ploum.b="this is plam"
      puts ploum.b
    end                                

    after do
      puts "inner after"
    end

    it "should do the second thing" do 
    puts "second test"
      2.must_equal 2                   
    end                                
  end                                  
  #first thing is not called here
end                                    
