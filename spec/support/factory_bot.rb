require 'factory_bot_rails'

RSpec.configure do |config|
    config.include FactoryBot::Syntax::Methods
end

# if this is set to true, then factories with associations will not actually have the association created:

# e.g.

# FactoryBot.define do
#   factory :author

#   factory :post do
#     author
#   end
# end

# post = build(:post)
# post.new_record?        # => true
# post.author.new_record? # => true

# post = create(:post)
# post.new_record?        # => false
# post.author.new_record? # => false
FactoryBot.use_parent_strategy = false
