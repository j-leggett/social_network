def reset_students_table
  seed_sql = File.read('spec/seeds_posts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
  connection.exec(seed_sql)
end

describe StudentRepository do
  before(:each) do 
    reset_students_table
  end


  xit 'Get all posts' do

    repo = PostRepository.new

    posts = repo.all

    posts.length # =>  2

    posts[0].id # =>  '1'
    posts[0].title # =>  'monday'
    posts[0].content # =>  'hello'
    posts[0].views # =>  15
    posts[0].user_id # =>  '1'

    posts[1].id # =>  '2'
    posts[1].title # =>  'tuesday'
    posts[1].content # =>  'hello back'
    posts[1].views # =>  15
    posts[1].user_id # =>  '2'
  
  end
    # 2
  xit 'Gets a single post' do

    repo = PostRepository.new

    post = repo.find(1)

    post.id # =>  1
    post.title # =>  'monday'
    post.content # =>  'hello'
    post.views # =>  15
    post.user_id # =>  '1'
  
  end
    
  xit 'creates a post' do

    repo = PostRepository.new

    new_post = Post.new
    new_post.title = # 'wednesday'
    new_post.content = # 'goodbye'
    new_post.views = # 23
    new_post.user_id = # '2'


    repo.create(new_post)

    all_posts = repo.all
    last_post = all_posts.last
    last_post.id # => 3
    last_post.title = # 'wednesday'
    last_post.content = # 'goodbye'
    last_post.views = # 23
    last_post.user_id = # '2'
  
  end 

end