# Set default locale to something other than :en
I18n.enforce_available_locales = false
I18n.available_locales = ["pt-BR"]
I18n.default_locale = :'pt-BR'

# Where the I18n library should search for translation files
I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

