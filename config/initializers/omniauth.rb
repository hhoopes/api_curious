Rails.application.config.middleware.use OmniAuth::Builder do
  provider :and_me, ENV['ANDME_KEY'], ENV['ANDME_SECRET'],
    {
    scope: 'basic genomes'
    }
end
