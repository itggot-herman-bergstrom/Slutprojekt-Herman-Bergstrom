class Seeder

  def self.seed!
      roles
      users
      categories
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


  def self.users
     User.create(first_name: 'Daniel',
                  last_name: 'Berg',
                  mail: 'daniel',
                  password:'swag',
                  role_id: 1)

      User.create(first_name: 'Kristian',
                  last_name: 'Lol',
                  mail: 'mail',
                  password: 'password',
                  role_id: 2)

  end

  def self.categories
      Category.create(name: 'Datorproblem'
      Category.create(name: 'Stöld')
      Category.create(name: 'Virus')
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

      KnowledgeBaseArticle.create(title: 'Det går inte att klicka på alternativen :(',
                                  content: 'This is something',
                                  category_id: 1,
                                  user_id: 1)

  end

end