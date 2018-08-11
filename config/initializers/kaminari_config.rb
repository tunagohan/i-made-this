Kaminari.configure do |config|
  config.default_per_page = 10
  config.param_name = :page
  config.params_on_first_page = true
end
