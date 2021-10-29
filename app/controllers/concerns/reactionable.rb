module Reactionable
  def reaction_model type
    type.classify.constantize
  end
end
