module Radius
  module Tag # :nodoc:
    
    def render(context)
      context.render_tag(tag_name, attributes)
    end
    
    def tag_name
      name.tag_name.text_value
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
    include Tag
    
    def render(context)
      context.render_tag(tag_name, attributes) { contents.render(context) }
    end
    
    def attrs
      open_tag.attrs
    end
    
    def name
      open_tag.name
    end
    
    # attr_accessor :name, :attributes, :contents
    # 
    # def initialize(name = "", attributes = {}, contents = [], &b)
    #   @name, @attributes, @contents = name, attributes, contents
    #   super(&b)
    # end
  end
end