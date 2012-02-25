module Refinery
  module Registrations
    module Controllers
      module Helpers
        extend ActiveSupport::Concern

        included do
          helper_method :resource_name
          helper_method :resource
          helper_method :devise_mapping
          helper_method :after_sign_in_path_for
          helper_method :current_registration
        end

        def resource_name
          :user
        end

        def resource
          @resource ||= User.new
        end

        def devise_mapping
          @devise_mapping ||= Devise.mappings[:user]
        end

        def after_sign_in_path_for(resource)
          stored_location_for(resource) || welcome_path
        end

        def current_registration
          return r if r = detached_user_registration
          Registration.find(session[:registration_id])
        rescue ActiveRecord::RecordNotFound
          return create_user_registration(current_user.id) if defined?(user_signed_in?) && user_signed_in?
          create_registration
        end

        private

        def welcome_path
          registrations_path
        end

        def detached_user_registration
          if defined?(user_signed_in?) && user_signed_in? && !session[:registration_id]
            r = Registration.where('parent_id = ?', current_user.id).limit(1)[0]
          end
          session[:registration_id] = r.id if r
          r
        end

        def create_registration
          Registration.new
        end

        def create_user_registration(user_id)
          Registration.new(parent_id: user_id)
        end

      end
    end
  end
end