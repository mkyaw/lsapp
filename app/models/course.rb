class Course < ActiveRecord::Base
    belongs_to :user
    has_many :questions
    
    validates :title, :description, presence: true
end
