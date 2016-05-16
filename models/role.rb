class Role
  include DataMapper::Resource

  property :id, Serial
  # property :name, String
  property :name, Enum[:student, :teacher, :admin]

  has n, :users
end