class AddNotificationPreferencesToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :notification_email, :boolean, default: true
    add_column :profiles, :notification_sms, :boolean, default: true
  end
end
