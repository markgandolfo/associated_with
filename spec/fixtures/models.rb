class Analyst < ActiveRecord::Base
  has_many :document_stores
  has_many :documents, :through => :document_stores
end

class Computer < ActiveRecord::Base
  belongs_to :programmer
end

class Document < ActiveRecord::Base
  has_many :document_stores
  has_many :analysts, :through => :document_stores
end

class DocumentStore < ActiveRecord::Base
  belongs_to :document
  belongs_to :analyst
end

class Programmer < ActiveRecord::Base
  has_and_belongs_to_many :projects
  has_one :computer
end

class Project < ActiveRecord::Base
  has_and_belongs_to_many :programmers
  has_many :tasks
end

class Task < ActiveRecord::Base
  belongs_to :project
end

