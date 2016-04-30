class Seeder

  def self.seed!
      roles
      users
      categories
      issues
      messages
      user_issues
  end

  def self.roles
      Role.create(name: 'Elev')
  end

  def self.user_issues
    UserIssue.create(user_id: 1,
                      issue_id: 1)
  end

  def self.users
     User.create(first_name: 'Herman',
                  last_name: 'Bergstrom',
                  mail: 'herman.bergstrom@itggot.se',
                  password:'SwagVictor',
                  role_id: 1)

  end

  def self.categories
      Category.create(name: 'Datorproblem')
  end

  def self.issues
      Issue.create(name: 'Datorn startar inte', description: 'Min dator fungerar icke',
                    category_id: 1)

  end

  def self.messages
      Message.create(message: 'Lorem ipsum spiritus whatever this message is just created to try out the new function.',
                     user_id: 1,
                     issue_id: 1 )
  end

end