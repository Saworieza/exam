module ExamAPI::V1::Entities
  class StudentResponseEntity < Grape::Entity
    expose :id, documentation: { type: 'integer', desc: 'Student Identifier' }
    expose :username, documentation: { type: 'String', desc: 'Student username' }
    expose :first_name, documentation: { type: 'String', desc: 'Student first name' }
    expose :last_name, documentation: { type: 'String', desc: 'Student last name' }
    expose :email, documentation: { type: 'String', desc: 'Student email' }
    expose :txstateid, documentation: { type: 'String', desc: 'Student TXStateID' }
    expose :major, documentation: { type: 'String', desc: 'Student major' }
    expose :phone, documentation: { type: 'String', desc: 'Student phone' }
  end
end
