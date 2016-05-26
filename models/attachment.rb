class Attachment
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :path, FilePath, required: true
  property :type, Discriminator
end

class MessageAttachment < Attachment
  belongs_to :message, required: false
end

class IssueAttachment < Attachment
  belongs_to :issue, required: false
end

class KnowledgeBaseArticleAttachment < Attachment
  belongs_to :knowledge_base_article, required: false
end