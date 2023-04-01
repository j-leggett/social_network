require 'post_repository'

def reset_posts_table
  seed_sql = File.read('spec/seeds_posts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do 
    reset_posts_table
  end


  it 'Get all posts' do

    repo = PostRepository.new

    posts = repo.all

    expect(posts.length).to eq 2

    expect(posts[0].id).to eq '1'
    expect(posts[0].title).to eq 'monday'
    expect(posts[0].content).to eq 'hello'
    expect(posts[0].views).to eq '15'
    expect(posts[0].user_id).to eq '1'

    expect(posts[1].id).to eq '2'
    expect(posts[1].title).to eq 'tuesday'
    expect(posts[1].content).to eq 'hello back'
    expect(posts[1].views).to eq '15'
    expect(posts[1].user_id).to eq '2'
  
  end
    # 2
  it 'Gets a single post' do

    repo = PostRepository.new

    post = repo.find(1)

    expect(post.id).to eq '1'
    expect(post.title).to eq 'monday'
    expect(post.content).to eq 'hello'
    expect(post.views).to eq '15'
    expect(post.user_id).to eq '1'
  
  end
    
  it 'creates a post' do

    repo = PostRepository.new

    new_post = Post.new
    new_post.title = 'wednesday'
    new_post.content = 'goodbye'
    new_post.views = '23'
    new_post.user_id = '2'


    repo.create(new_post)

    all_posts = repo.all
    last_post = all_posts.last
    expect(last_post.id).to eq '3'
    expect(last_post.title).to eq 'wednesday'
    expect(last_post.content).to eq'goodbye'
    expect(last_post.views).to eq '23'
    expect(last_post.user_id).to eq '2'
  
  end 

  it "deletes post with id == 1" do

    repo = PostRepository.new

    repo.delete('1')

    all_posts = repo.all

    expect(all_posts.length).to eq 1
    expect(all_posts.first.id).to eq '2'
  end

end
