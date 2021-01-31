if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: '_appointmentNow', domain: 'appointmentnow.netlify.app'
  else
    Rails.application.config.session_store :cookie_store, key: '_appointmentNow' 
  end