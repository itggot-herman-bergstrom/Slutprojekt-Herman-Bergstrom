class Category
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has n, :knowledge_base_articles
  has n, :issues
end