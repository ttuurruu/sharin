class EvaluationSetting < ActiveRecord::Base
  belongs_to :user
  belongs_to :evaluation_event
  belongs_to :evaluation_objective
  belongs_to :ability_grouping

  has_many :evaluation_settings
  has_many :evaluation_evaluators
  accepts_nested_attributes_for :evaluation_evaluators

end
