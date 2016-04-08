class ExamAPI::V1::Exams < Grape::API
  resource :exams do
    desc 'Return all exams'
    get do
      present Exam.all, with: ExamAPI::V1::Entities::ExamResponseEntity
    end

    desc 'Return exam with the id provided'
    params do
      requires :id, type: Integer, desc: 'Exam Id'
    end

    get ':id' do
      exam = Exam.find_by_id(params[:id])
      if exam
        present exam, with: ExamAPI::V1::Entities::ExamResponseEntity
      else
        status 404
      end
    end

    desc 'Create Exam'
    params do
      requires :exam, type: Hash do
        requires :exam_type, type: String, desc: 'Exam Type'
        requires :date, type: Date, desc: 'Date'
        requires :start_time, type: Time, desc: 'Start time'
        requires :end_time, type: Time, desc: 'End time'
        requires :semester, type: String, desc: 'Semester'
        requires :location, type: String, desc: 'Location'
        requires :deadline, type: Date, desc: 'Deadline'
      end
    end

    post do
      exam = Exam.create!(params[:exam])
      present exam, with: ExamAPI::V1::Entities::ExamResponseEntity
    end

    desc 'Edit Exam'
    params do
      requires :id, type: Integer, desc: 'Exam Id'
      requires :exam, type: Hash do
        optional :exam_type, type: String, desc: 'Type'
        optional :date, type: Date, desc: 'Date'
        optional :start_time, type: Time, desc: 'Start time'
        optional :end_time, type: Time, desc: 'End time'
        optional :semester, type: String, desc: 'Semester'
        optional :location, type: String, desc: 'Location'
        optional :deadline, type: Date, desc: 'Deadline'
      end
    end

    put ':id' do
      exam = Exam.find_by_id(params[:id])
      if exam
        exam.update(params[:exam])
        present exam, with: ExamAPI::V1::Entities::ExamResponseEntity
      else
        status 404
      end
    end

    desc 'Remove Exam'
    params do
      requires :id, type: Integer, desc: 'Exam Id'
    end

    delete ':id' do
      exam = Exam.find_by_id(params[:id])
      if exam
        exam.destroy
        status 200
      else
        status 404
      end
    end
  end
end
