ENV['ETSY_TOKEN'] ||= 'anyn3g6lwjlisiun3oa68u6w'
ENV['ETSY_SECRET'] ||= 'qpgy9v8vp'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :etsy, ENV['ETSY_TOKEN'], ENV['ETSY_SECRET']
  provider :developer if Rails.env.development?
end

Etsy.environment = :production
Etsy.protocol = 'https'
Etsy.api_key = ENV['ETSY_TOKEN']
