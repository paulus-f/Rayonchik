class Invite < ApplicationRecord
  has_secure_token :string
end
