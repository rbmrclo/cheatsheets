### attr_accessor

  def name=(name)
    puts "Naming your person #{name}!"
    @name = name
  end

  is equal to

  attr_accessor :name

    
### alias

  # Creates an alias or duplicate method name for a given method.
  # The original method continues to be accessible via the alias, even if it is overriden
  # Takes two method-name arguments (which can be represented by strings or symbols but can also be the bare names themselves).
    
    class Person
      def name=(name)
        puts "Naming your person #{name}!"
        @name = name
      end

      alias full_name= name=
    end

    p = Person.new
    p.full_name = "Jejeje" # #<Person:0x007fe08cfe5de8 @name="jeje">

### metaprogramming
  
 class Object

   # The hidden singleton lurks behind everyone
   def metaclass; class << self; self; end; end
   def meta_eval &blk; metaclass.instance_eval &blk; end
 
   # Adds methods to a metaclass
   def meta_def name, &blk
     meta_eval { define_method name, &blk }
   end
 
   # Defines an instance method within a class
   def class_def name, &blk
     class_eval { define_method name, &blk }
   end

 end

