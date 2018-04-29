module ApplicationHelper
  def bootstrap_alert_name(key)
    case key.to_sym
      when :notice then 'info'
      when :success then 'success'
      when :alert then 'warning'
      when :error then 'danger'
      else 'info'
    end
  end
end
