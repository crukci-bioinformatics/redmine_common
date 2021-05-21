module Bioinf_Common

  module IssuePatch
    def self.included(base)
      base.class_eval do
        before_validation :ensure_archive_path_set
        def ensure_archive_path_set
          archivePathId = CustomField.find_by(name: "Archive Path").id
          archiveNeededId = CustomField.find_by(name: "Archive Needed").id
          begin
            path = "unset"
            path_needed = "unset"
            flds = self.custom_field_values
            flds.each do |x|
              if x.custom_field_id == archivePathId
                path = x.value
              elsif x.custom_field_id == archiveNeededId
                path_needed = x.value
              end
            end
            if self.status.name == "Closed" and path.blank? and path_needed == "1"
              warnings.add(:archive_path, "Warning: Archive path should be set for closed projects.")
            end
          end
        end

        def warnings
          @warnings ||= ActiveModel::Errors.new(self)
        end
      end
    end
  end
end

