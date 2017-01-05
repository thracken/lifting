class Exercise < ActiveRecord::Base
  validates :name, presence: true
  validates :weight, presence: true
  validates :weight_increment, presence: true
  validates :reps_goal, presence: true
  validates :sets_goal, presence: true

  has_and_belongs_to_many :exercise_groups

  def increment_weight
    self.weight = self.weight + self.weight_increment
  end
end
