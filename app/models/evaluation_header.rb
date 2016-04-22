class EvaluationHeader < ActiveRecord::Base
  belongs_to :evaluation_setting
  has_many :evaluation_details
end
