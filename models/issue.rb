class Issue
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :description, String, required: true
  property :created_at, DateTime

  belongs_to :category
  belongs_to :status
  has n, :user_issues
  has n, :users, :through => :user_issues
  has n, :issue_attachments
  has n, :messages

end