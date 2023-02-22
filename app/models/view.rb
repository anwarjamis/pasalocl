class View < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  attribute :views, :integer, default: 0
  attribute :last_viewed_at, :datetime, default: nil
end
