class Attachment
  include DataMapper::Resource

  property :id, Serial
  property :content, String, required: true

  belongs_to :message
  belongs_to :issue
  belongs_to :knowledge_base_article
end