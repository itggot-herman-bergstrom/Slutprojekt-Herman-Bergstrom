class Status
  include DataMapper::Resource

  property :id, Serial
  property :name, Enum[:active, :closed, :unaddressed]

  has n, :issues
end