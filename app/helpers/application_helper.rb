module ApplicationHelper
  def body_class
    "#{controller.controller_name}-#{controller.action_name}".gsub('_','-')
  end
end
