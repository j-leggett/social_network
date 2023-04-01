require_relative 'lib/database_connection'
require_relative 'lib/post_repository'
require_relative 'lib/user_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('social_network')

post_repository = PostRepository.new

post_repository.all.each do |posts|
  p posts
end

# user_repository = UserRepository

# user_repository.all.each do |users|
#   p users
# end