class EvaluationEvaluator < ActiveRecord::Base
  belongs_to :evaluation_setting
  belongs_to :user
end
