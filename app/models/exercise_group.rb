class ExerciseGroup < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :routine

  has_many :exercises
end
