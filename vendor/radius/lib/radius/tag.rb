module Radius
  module Tag # :nodoc:
    
    def render(context)
      context.render_tag(name.tag_name.text_value, attributes)
    end
    
    def attributes
      attrs.hash
    end
    
    # def initialize(&b)
    #   @block = b
    # end
    # 
    # def on_parse(&b)
    #   @block = b
    # end
    # 
    # def to_s
    #   @block.call(self)
    # end
  end

  module ContainerTag # :nodoc:
    # attr_accessor :name, :attributes, :contents
    # 
    # def initialize(name = "", attributes = {}, contents = [], &b)
    #   @name, @attributes, @contents = name, attributes, contents
    #   super(&b)
    # end
  end
end