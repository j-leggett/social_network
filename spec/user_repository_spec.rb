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

    expect(users.length).to eq '2'

    expect(users[0].id).to eq '1'
    expect(users[0].email_address).to eq 'h@b.com'
    expect(users[0].username).to eq 'h123'

    expect(users[1].id).to eq '2'
    expect(users[1].email_address).to eq 'x@y.com'
    expect(users[1].username).to eq 'x000'

  end

  xit 'Gets a single user' do

    repo = UserRepository.new

    user = repo.find(1)

    student.id # =>  1
    student.name # =>  'h@b.com'
    student.cohort_name # =>  'hl23'
  end

  xit 'creates a user' do

    repo = UserRepository.new

    new_user = User.new
    new_user.email_adress = # 'q@w.com'
    new_user.username = # 'qwerty'

    repo.create(new_user)

    all_users = repo.all
    last_user = all_users.last
    last_user.id # => 3
    last_user.email_address # => 'q@w.com'
    last_user.username #=> 'qwerty'
  end

end