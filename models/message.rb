class Message
  include DataMapper::Resource

  property :id, Serial
  property :date, DateTime
  property :message, String, required: true

  belongs_to :user
  belongs_to :issue
  has n, :attachments

end