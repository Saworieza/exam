require 'grape-swagger'

class API < Grape::API

  rescue_from :all, :backtrace => true

  default_format :json
  format :json

  mount ExamAPI::V1::Base

end
