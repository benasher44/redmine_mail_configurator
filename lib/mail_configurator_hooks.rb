module MailConfiguratorPlugin
  module Hooks
    class LayoutHook < Redmine::Hook::ViewListener

      def view_projects_settings_members_table_header(context={ })
        return "<th>#{l(:label_mail_if)}</th>"
      end

      def view_projects_settings_members_table_row(context = {})
        return context[:controller].send(:render_to_string, {
            :partial => 'mail_configurator/mail_if',
            :locals => context,
            :layout => false
          })
      end

      def view_my_account(context={ })
        return context[:controller].send(:render_to_string, {
            :partial => 'mail_configurator/view_my_account',
            :locals => { :user_pref => context[:user].pref }
          })
      end

    end
  end
end
