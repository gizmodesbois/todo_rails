module ApplicationHelper
    def bootstrap_class_for flash_type
        bootstrap_flash_message = {
            success: 'alert-success',
            error: 'alert-error',
            alert: 'alert-block',
            notice: 'alert-info'
          }

        bootstrap_flash_message.fetch(flash_type.to_sym, flash_type.to_s)
    end

    def flash_messages(opts = {})
        flash.each do |msg_type, message|
            concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
            concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
            concat message
        end)
        end
        nil
    end

end