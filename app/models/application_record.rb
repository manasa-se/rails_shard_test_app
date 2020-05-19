class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  connects_to shards: {
    default: { writing: :primary },
    shard_one: { writing: :primary_shard_one }
  }
end
