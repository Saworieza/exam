class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  belongs_to :role
  belongs_to :student

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def faculty?
    self.role.name == 'Faculty'
  end

  def student?
    self.role.name == 'Student'
  end
end
