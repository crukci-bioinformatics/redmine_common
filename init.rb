require 'redmine'

Redmine::Plugin.register :bioinf_common do
  name 'Bioinf Common plugin'
  author 'Gord Brown'
  description 'Common code for Bioinformatics Core plugins'
  version '1.0.0'
  url 'https://github.com/crukci-bioinformatics/redmine_common'
  author_url 'http://gdbrown.org/blog/'

  settings(:default => { 'non_chargeable' => 'Experimental Design Meetings; Statistics Clinic Meeting',
                         'holiday_url' => 'https://www.gov.uk/bank-holidays.json',
                         'billable' => 'Research Groups; Fitzgerald; Genomics; Innovation Lab'},
           :partial => 'settings/project_state_settings' )
end

#Rails.configuration.after_initialize do
#  Issue.send(:include,ProjectStatePlugin::IssuePatch)
#  Project.send(:include,ProjectStatePlugin::ProjectPatch)
  # the following steps are necessary in case the "root_projects" variable
  # has been altered... may need to add new projects to the custom fields,
  # and if so, add default CustomField values to issues
#  initr = ProjectStatePlugin::Initializer.new
#  initr.init_logger
#  initr.init_random
#  initr.ensure_custom_fields # ensure custom fields are present (should only need to be created once)
#  projSet = initr.ensure_projects_have_custom_fields
#  initr.populate_reports
#  initr.ensure_issues_have_custom_fields(projSet)
#end
