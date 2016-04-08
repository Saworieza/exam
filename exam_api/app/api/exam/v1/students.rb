class Exam::V1::Students < Grape::API
  resource :students do
    desc 'Return the list of students'
    get do
      error!("Not implemented")
    end
  end
end
