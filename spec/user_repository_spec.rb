require 'user_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

 it 'Gets all users' do

    repo = UserRepository.new

    users = repo.all

    expect(users.length).to eq 2

    expect(users[0].id).to eq '1'
    expect(users[0].email_address).to eq 'h@b.com'
    expect(users[0].username).to eq 'h123'

    expect(users[1].id).to eq '2'
    expect(users[1].email_address).to eq 'x@y.com'
    expect(users[1].username).to eq 'x000'

  end

  it 'Gets a single user' do

    repo = UserRepository.new

    user = repo.find(1)

    expect(user.id).to eq '1'
    expect(user.email_address).to eq 'h@b.com'
    expect(user.username).to eq "h123" 
  end

  it 'creates a user' do

    repo = UserRepository.new

    new_user = User.new
    new_user.email_address = 'q@w.com'
    new_user.username = 'qwerty'

    repo.create(new_user)

    all_users = repo.all
    last_user = all_users.last
    expect(last_user.id).to eq '3'
    expect(last_user.email_address).to eq 'q@w.com'
    expect(last_user.username).to eq 'qwerty'
  end

  it 'deletes user with id 1' do
    repo = UserRepository.new

    repo.delete(1)

    users = repo.all
    expect(users.length).to eq 1
  end

end