module AssociatedWith
  def associated_with? object
    class_name = object.class.to_s.downcase

    if self.respond_to?(class_name.pluralize)
      association = class_name.pluralize
      return self.__send__(association).include?(object)
    elsif self.respond_to?(class_name.singularize)
      association = class_name.singularize
      return self.__send__(association) == object
    else
      return false
    end
    
  end
end

ActiveRecord::Base.send :include, AssociatedWith
