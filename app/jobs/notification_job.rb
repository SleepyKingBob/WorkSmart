class NotificationJob < ApplicationJob
  queue_as :default

  def perform(user)
    user.notification.destroy unless user.notification.nil?
    @notification = Notification.new(content: "Please Take a Break. I beg")
    @notification.user = user
    @notification.save
    redirect_to dashboard_path
  end
end
