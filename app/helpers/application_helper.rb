module ApplicationHelper
  
  def stylized_flash(key)
      case key
        when :alert
          "warning"
        when :error
          "error"
        when :notice
          "info"
        when :success
          "success"
        else
          key.to_s
      end
    end
    
end
