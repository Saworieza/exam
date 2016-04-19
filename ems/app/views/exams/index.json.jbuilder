json.array!(@exams) do |exam|
  json.extract! exam, :id, :type, :date, :start_time, :end_time, :semester, :location, :registration_deadline
  json.url exam_url(exam, format: :json)
end
