class Heart < Reaction
  belongs_to :reactable, polymorphic: true, counter_cache: true
end
