require 'grape-swagger'

class API < Grape::API

  rescue_from :all, :backtrace => true

  format :json

  mount Exam::V1::Base

end
