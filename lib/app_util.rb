module AssociationAttriQuery
  def method_missing(name, *args)
      method = name.to_s
      related_class_names = self.class.reflect_on_all_associations(:belongs_to).collect do |association|
        association.name
      end

      related_class_names.each do |related_class_name|
        if method =~ /^#{related_class_name}_*/
          attribute = method.sub(/^#{related_class_name}_/, "")
          return self.send(related_class_name).send(attribute)
        end
      end
      super
    end
end

ActiveRecord::Base.send(:include, AssociationAttriQuery)