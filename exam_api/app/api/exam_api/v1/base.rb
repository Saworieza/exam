require 'grape-swagger'

module ExamAPI
  module V1
    class Base < Grape::API
      prefix :api
      version :v1, using: :header, vendor: 'exam'

      mount Students
      mount Exams

      add_swagger_documentation api_version: 'v1',
                                hide_documentation_path: true
    end
  end
end
