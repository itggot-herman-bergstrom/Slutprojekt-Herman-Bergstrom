class KnowledgeBaseArticle
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :content, String
  property :date, DateTime

  belongs_to :category
  belongs_to :user
  has n, :attachments
end