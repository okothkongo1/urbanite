SimpleCov.start do
  add_filter ['app/channels', 'app/jobs', 'app/mailers', 'spec/', 'app/dashboard', 'app/controller/admin']
  add_group 'Models', 'app/models'
  add_group 'Controllers', 'app/controllers'
  add_group 'Libs', 'lib'
  add_group 'Views', 'app/views'
  add_group 'Helpers', 'app/helpers'
  add_group 'Config', 'config'
end