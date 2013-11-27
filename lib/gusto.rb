class Object

  alias_method :old_method_missing, :method_missing

  def method_missing(method, *args, &block)
    return old_method_missing(method, *args, &block) unless __¿calificado?(method)

    gringo = method.to_s.gsub(/^[¿¡]/, '').to_sym
    if respond_to? gringo
      send(gringo, *args, &block)
    else
      old_method_missing(method, *args, &block)
    end
  end

  private

  def __¿calificado?(method)
    __inversions[ method[0] ] == method[-1]
  end

  def __inversions
    {
      '¿' => '?',
      '¡' => '!',
    }
  end

end
