class KnowledgeBaseArticle
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :content, String
  property :date, DateTime

  belongs_to :category
  belongs_to :user
  has n, :knowledge_base_article_attachments
end