module Delegation
  def delegate *methods, receiver
    define_method :method_missing do |method, *args, &block|
      if methods.include?(method)
        receiver[:to].send(method, *args, &block)
      else
        raise NoMethodError
      end
    end
  end
end