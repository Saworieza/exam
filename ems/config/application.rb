require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ems
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.action_view.field_error_proc = Proc.new { |html_tag, instance|
      puts instance.error_message
      if html_tag =~ /<(input|label|textarea|select)/
        html_field = Nokogiri::HTML::DocumentFragment.parse(html_tag)
        input = html_field.css('input')
        puts input
        label = html_field.css('label')
        input.add_class 'invalid'
        label.attr 'data-error', instance.error_message.first
        html_field.to_s.html_safe
      else
        html_tag
      end
    }
  end
end
