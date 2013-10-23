module Delegation
  def delegate *methods, receiver
    methods.each do |method|
      define_method method do
        if receiver[:to].respond_to?(method)
          receiver[:to].public_send(method)
        else
          raise NoMethodError
        end
      end
    end
  end
end