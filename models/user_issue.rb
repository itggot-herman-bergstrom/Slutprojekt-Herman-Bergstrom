class UserIssue
  include DataMapper::Resource

  property :id, Serial

  belongs_to :user, :key => true
  belongs_to :issue, :key => true
end