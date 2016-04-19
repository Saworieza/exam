json.array!(@students) do |student|
  json.extract! student, :id, :username, :txstateid, :last_name, :first_name, :major, :email
  json.url student_url(student, format: :json)
end
