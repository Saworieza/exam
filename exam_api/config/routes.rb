Rails.application.routes.draw do

  #Configuration Swagger
  mount GrapeSwaggerRails::Engine => '/swagger'

  mount API => '/'

end
