module ContactsHelper
  def bootstrap_flash_class(flash_type)
    { success: 'alert-success',
      error:   'alert-danger',
      alert:   'alert-warning',
      notice:  'alert-info',
      recaptcha_error: 'alert-danger'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def render_flash
    capture_haml do
      flash.each do |type, message|
        alert = bootstrap_flash_class(type)
        haml_tag :div, class: "alert #{alert}" do
          haml_concat "#{message}"
          haml_tag :button, class: 'close',  data: { dismiss: 'alert' } do
            haml_concat "x"
          end
        end unless message.blank?
      end
    end
  end

end
