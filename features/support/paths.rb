module NavigationHelpers
  module Refinery
    module Registrations
      def path_to(page_name)
        case page_name
        when /the list of registrations/
          admin_registrations_path

         when /the new registration form/
          new_admin_registration_path
        when /the list of registration_sessions/
          admin_registration_sessions_path

         when /the new registration_session form/
          new_admin_registration_session_path
        when /the list of children/
          admin_children_path

         when /the new child form/
          new_admin_child_path
        when /the list of child_registrations/
          admin_child_registrations_path

         when /the new child_registration form/
          new_admin_child_registration_path
        when /the list of educational_stages/
          admin_educational_stages_path

         when /the new educational_stage form/
          new_admin_educational_stage_path
        when /the list of fees/
          admin_fees_path

         when /the new fee form/
          new_admin_fee_path
        else
          nil
        end
      end
    end
  end
end
