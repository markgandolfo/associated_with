require 'spec_helper'

describe Task do

  context "test if no association is present between the two objects" do
    it "should return false if no association exists" do
      programmer = Factory(:programmer)
      task = Factory(:task)
      
      task.associated_with?(programmer).should eql(false)
    end    
  end

  context "has_one association (programmer -> computer)" do
    it "should return false if object 1 is not associated with an object2" do
      programmer1 = Factory(:programmer)
      computer1 = Factory(:computer, :programmer_id => programmer1.id)
      programmer2 = Factory(:programmer)
      computer2 = Factory(:computer, :programmer_id => programmer2.id)
      
      programmer1.associated_with?(computer2).should eql(false)
      programmer2.associated_with?(computer1).should eql(false)
    end
    
    it "should return true if object1 is associated with object2" do
      programmer = Factory(:programmer)
      computer = Factory(:computer, :programmer_id => programmer.id)
      programmer.associated_with?(computer).should eql(true)
    end
  end

  context "belongs_to associations (task -> project)" do 
    it "should return false if object 1 is not associated with an object2" do
      project1 = Factory(:project)
      task1 = Factory(:task, :project_id => project1.id)
      project2 = Factory(:project)
      task2 = Factory(:task, :project_id => project2.id)
      
      task1.associated_with?(project2).should eql(false)
      task2.associated_with?(project1).should eql(false)
    end
    
    it "should return true if object1 is associated with object2" do
      project = Factory(:project)
      task = Factory(:task, :project_id => project.id)
      
      task.associated_with?(project).should eql(true)
    end
  end
  
  context "has_many associations (project -> tasks)" do
    it "should return false if object 1 is not associated with an object2" do
      project1 = Factory(:project)
      task1 = Factory(:task, :project_id => project1.id)
      project2 = Factory(:project)
      task2 = Factory(:task, :project_id => project2.id)
      
      project1.associated_with?(task2).should eql(false)
      project2.associated_with?(task1).should eql(false)
    end
    
    it "should return true if object1 is associated with object2" do
      project = Factory(:project)
      task = Factory(:task, :project_id => project.id)
      
      project.associated_with?(task).should eql(true)
    end 
  end

  context "has_and_belongs_to_many associations (programmer -> project)" do
    it "should return false if object 1 is not associated with an object2" do
      project1 = Factory(:project)
      programmer1 = Factory(:programmer)
      project1.programmers << programmer1
      
      project2 = Factory(:project)
      programmer2 = Factory(:programmer)
      project2.programmers << programmer2
      
      project1.associated_with?(programmer2).should eql(false)
      project2.associated_with?(programmer1).should eql(false)
    end
    
    it "should return true if object1 is associated with object2" do
      project = Factory(:project)
      programmer = Factory(:programmer)
      project.programmers << programmer
      
      project.associated_with?(programmer).should eql(true)
    end 
  end

  context "has_many through associations (analyst -> document_store -> document)" do
    it "should return false if object 1 is not associated with an object2" do
      analyst1 = Factory(:analyst)
      document1 = Factory(:document)
      analyst1.documents << document1

      analyst2 = Factory(:analyst)
      document2 = Factory(:document)
      analyst2.documents << document2
    
      analyst1.associated_with?(document2).should eql(false)
      analyst2.associated_with?(document1).should eql(false)
      document1.associated_with?(analyst2).should eql(false)
      document2.associated_with?(analyst1).should eql(false)
    end

    it "should return true if object1 is associated with object2" do
      analyst = Factory(:analyst)
      document = Factory(:document)
      analyst.documents << document
      
      analyst.associated_with?(document).should eql(true)
      document.associated_with?(analyst).should eql(true)
    end
  end

  ## TODO test polymorphic
end