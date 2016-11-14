class ExerciseGroup < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :routine

  has_and_belongs_to_many :exercises
end
