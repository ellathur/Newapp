if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_2BiTbYp777ybBnASkaQHgpxs',
    secret_key: 'sk_test_eXhwIGyz4Ni0XG6A7ksWKflm'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
