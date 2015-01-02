class User < ActiveRecord::Base
  has_many :posts,
    dependent: :destroy,
    inverse_of: :user

  has_many :meows,
    dependent: :destroy,
    inverse_of: :user
    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
