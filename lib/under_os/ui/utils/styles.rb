#
# The styles handling API for UIView
#
module UnderOs::UI::Styles
  def tag_name
    @_tag_name ||= self.class.name.split('::').pop.underscore.upcase
  end

  def id
    @_id
  end

  def id=(id)
    @_id = id
  end

  def style
    @_style ||= UnderOs::UI::Style.new(@_)
  end

  def style=(hash)
    hash.each{ |key, value| style.__send__("#{key}=", value)}
  end

  def class_name
    (@_class_names || []).join(' ')
  end

  def class_name=(names)
    @_class_names = names.scan(/([a-z0-9\-_]+)/).map{|e| e[0]}
  end
end