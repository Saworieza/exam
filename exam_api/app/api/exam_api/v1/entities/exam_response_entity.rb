module ExamAPI::V1::Entities
  class ExamResponseEntity < Grape::Entity
    format_with :time do |time|
      time.strftime('%H:%M:%S')
    end

    expose :id, documentation: { type: 'integer', desc: 'Exam Identifier' }
    expose :exam_type, documentation: { type: 'String', desc: 'Exam type' }
    expose :date, documentation: { type: 'Date', desc: 'Exam date' }
    expose :start_time, :format_with => :time, documentation: { type: 'Time', desc: 'Exam start time' }
    expose :end_time, :format_with => :time, documentation: { type: 'Time', desc: 'Exam end time' }
    expose :semester, documentation: { type: 'String', desc: 'Exam semester' }
    expose :location, documentation: { type: 'String', desc: 'Exam location' }
    expose :deadline, documentation: { type: 'Date', desc: 'Registration deadline' }
  end
end
