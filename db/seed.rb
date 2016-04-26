class Seeder

  def self.seed!
      roles
      users
      categories
      issues
  end

  def self.roles
      Role.create(name: 'Elev')
  end

  def self.users
      User.create(first_name: 'Herman',
                  last_name: 'Bergstrom',
                  mail: 'herman.bergstrom@itggot.se',
                  role_id: 1)
  end

  def self.categories
      Category.create(name: 'Datorproblem')
  end

  def self.issues
      Issue.create(name: 'Datorn startar inte',
                    category_id: 1)
  end

end