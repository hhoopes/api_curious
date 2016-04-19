Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twenty_three_and_me,
    ENV['23ANDME_KEY'],
    ENV['23ANDME_SECRET'],
    { scope: 'basic genomes'
    }
end