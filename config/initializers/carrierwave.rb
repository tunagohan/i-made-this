CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: ENV['FOG_PROVIDER'],
    aws_access_key_id: ENV['FOG_ACCESS_KEY'],
    aws_secret_access_key: ENV['FOG_SECRET_ACCESS_KEY'],
    region: ENV['FOG_REGION'],
    path_style: true
  }

  config.fog_directory = ENV['FOG_S3_BUCKET_NAME']
  config.asset_host = ENV['FOG_S3_URL']

  config.fog_public = false
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
  config.storage = :fog
end
# 日本語の文字化けを防ぐ
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
