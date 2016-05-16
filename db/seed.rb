class Seeder

  def self.seed!
      roles
      users
      categories
      issues
      messages
      user_issues
      knowledge_base_articles
      status
  end

  def self.roles
      Role.create(name: :student)
      Role.create(name: :admin)
      Role.create(name: :teacher)
  end

  def self.status
    Status.create(name: :active)
    Status.create(name: :closed)
    Status.create(name: :unaddressed)
  end

  def self.user_issues
    UserIssue.create(user_id: 1,
                      issue_id: 1)
    UserIssue.create(user_id: 1,
                     issue_id: 2)
  end

  def self.users
     User.create(first_name: 'Herman',
                  last_name: 'Bergstrom',
                  mail: 'herman.bergstrom@itggot.se',
                  password:'SwagVictor',
                  role_id: 1)

      User.create(first_name: 'Kristian',
                  last_name: 'Quickscoper',
                  mail: 'kristian@gmail.com',
                  password: 'password123',
                  role_id: 2)

  end

  def self.categories
      Category.create(name: 'Datorproblem')
  end

  def self.issues
      Issue.create(name: 'Datorn startar inte',
                   description: 'Min dator fungerar icke',
                   category_id: 1,
                    status_id: 1,)

      Issue.create(name: 'Blåskärm',
                   description: 'Min har en jäkla blåskärm',
                   category_id: 1,
                    status_id: 2)
  end

  def self.messages
      Message.create(message: 'Lorem ipsum spiritus whatever this message is just created to try out the new function.',
                     user_id: 1,
                     issue_id: 1 )
  end

  def self.knowledge_base_articles
      KnowledgeBaseArticle.create(title: 'Datorn startar inte',
                                  content: 'This is something',
                                  category_id: 1,
                                  user_id: 1)

      KnowledgeBaseArticle.create(title: 'Blå skärm',
                                  content: 'This is something',
                                  category_id: 1,
                                  user_id: 1)

  end

end