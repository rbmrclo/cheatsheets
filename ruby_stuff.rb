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


 # instance_eval
 # Object.instance_eval evaluates a string (or the given block) within the context of a certain class instance and allows thus the direct access to class properties without attr or attr_accessor. It allows you to define new methods for a instance

  class Klass
    def initialize
      @secret = 99
    end
  end
  k = Klass.new
  k.instance_eval("@secret")    # => "99"
  k.instance_eval("@secret=42") # => "42"
   
  k.instance_eval("def hi() \"Hello there\" end")
  k.hi()  # => "Hello there"

  # eval
  # Kernel.eval evaluates a string in the current context or the context of the given binding. It is the method used by IRB to process your input. It allows you to define new variables and methods for the current context.

  def secret(number)
    return binding
  end

  number = "42"
  eval "number"                #=> "42"
  eval "number", secret("99")  #=> "99"
   
  eval "def hi() \"Hello there\" end"
  hi()  # => "Hello there"

  # module_eval
  # As the name says, Module.module_eval evaluates the string or block in the context of a module or class (Synonym: class_eval). module_eval allows you to define new instance method for a class.

  String.module_eval do

    def secret
      "42"
    end

  end
   
  "string".secret    #=> "42"
