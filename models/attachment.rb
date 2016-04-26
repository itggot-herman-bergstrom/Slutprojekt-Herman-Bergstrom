class Attachment
  include DataMapper::Resource

  property :id, Serial
  property :content, String, required: true

  belongs_to :message
  belongs_to :issue
  has 1,   :knowledge_base_article
end