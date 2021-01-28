if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: '_AppointmentNow', domain: 'https://appointmentnow.netlify.app'
  else
    Rails.application.config.session_store :cookie_store, key: '_AppointmentNow' 
  end