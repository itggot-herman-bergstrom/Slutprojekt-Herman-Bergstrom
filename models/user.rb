class User
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String, required: true
  property :last_name, String, required: true
  property :mail, String, required: true
  property :password, BCryptHash, required: true

  belongs_to :role
  has n, :messages
  has n, :user_issues
  has n, :issues, :through => :user_issues
  has n, :knowledge_base_articles

end