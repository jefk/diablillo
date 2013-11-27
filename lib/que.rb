class Object
  alias_method :old_method_missing, :method_missing

  def method_missing(message, *args, &block)
    return old_method_missing(message, *args, &block) unless message.to_s =~ /^[¿¡]/

    gringo = message.to_s.gsub(/^[¿¡]/, '').to_sym
    if respond_to? gringo
      send(gringo, *args, &block)
    else
      old_method_missing(message, *args, &block)
    end
  end
end
