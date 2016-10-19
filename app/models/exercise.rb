class Exercise < ActiveRecord::Base
  validates :name, presence: true
  validates :weight, presence: true
  validates :weight_increment, presence: true
  validates :reps_goal, presence: true
  validates :sets_goal, presence: true

  belongs_to :exercise_group

end
