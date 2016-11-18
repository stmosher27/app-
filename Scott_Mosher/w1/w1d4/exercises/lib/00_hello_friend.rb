class Friend
  # TODO: your code goes here!
  def initialize(name = nil)
    @name = name
end
  
  def greeting(name = nil)
     if name == nil
         "Hello!"
     else
         "Hello, #{name}!"
     end
  end
end
