require_dependency 'custom_value'

module ExtendedCustomValuePatch

    def self.included(base)
        base.send(:include, InstanceMethods)
        base.class_eval do
            unloadable

            alias_method_chain :editable?, :extended
        end
    end

    module InstanceMethods

        def editable_with_extended?
            if customized.new_record?
                custom_field.is_for_new? && editable_without_extended?
            else
                editable_without_extended?
            end
        end

    end

end
