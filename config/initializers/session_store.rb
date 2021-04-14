if Rails.env === 'production'
    Rails.application.config.session_store :cookie_store, key: '_pom-rails', domain: 'http://localhost:3001'
else
    Rails.application.config.session_store :cookie_store, key: '-pom-rails'
end