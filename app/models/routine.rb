class Routine < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :user

  has_many :exercise_groups
end
