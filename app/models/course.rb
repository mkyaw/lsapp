class Course < ActiveRecord::Base
    belongs_to :user
    has_many :questions
    
    validates :title, presence: true
end
