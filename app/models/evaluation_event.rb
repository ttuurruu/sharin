class EvaluationEvent < ActiveRecord::Base
  has_many :evaluation_settings

  default_scope { where("deleted_at IS NULL") }

end
