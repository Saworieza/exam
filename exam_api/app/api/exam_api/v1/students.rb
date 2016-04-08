class ExamAPI::V1::Students < Grape::API
  resource :students do
    desc 'Return all students'
    get do
      Student.all
    end

    desc 'Return student with the id provided'
    params do
      requires :id, type: Integer, desc: 'Student Id'
    end

    get ':id' do
      student = Student.find_by_id(params[:id])
      if student
        student
      else
        status 404
      end
    end

    desc 'Create Student'
    params do
      requires :student, type: Hash do
        requires :username, type: String, desc: 'Username'
        requires :txstateid, type: String, desc: 'Texas State ID'
        requires :first_name, type: String, desc: 'First name'
        requires :last_name, type: String, desc: 'Last name'
        requires :major, type: String, desc: 'Major'
        requires :email, type: String, desc: 'Email'
        requires :phone, type: String, desc: 'Phone'
      end
    end

    post do
      Student.create!(params[:student])
    end

    desc 'Edit Student'
    params do
      requires :id, type: Integer, desc: 'Student Id'
      requires :student, type: Hash do
        optional :username, type: String, desc: 'Username'
        optional :txstateid, type: String, desc: 'Texas State ID'
        optional :first_name, type: String, desc: 'First name'
        optional :last_name, type: String, desc: 'Last name'
        optional :major, type: String, desc: 'Major'
        optional :email, type: String, desc: 'Email'
        optional :phone, type: String, desc: 'Phone'
      end
    end

    put ':id' do
      student = Student.find_by_id(params[:id])
      if student
        student.update(params[:student])
        student
      else
        status 404
      end
    end

    desc 'Remove Student'
    params do
      requires :id, type: Integer, desc: 'Student Id'
    end

    delete ':id' do
      student = Student.find_by_id(params[:id])
      if student
        student.destroy
        status 200
      else
        status 404
      end
    end
  end
end
