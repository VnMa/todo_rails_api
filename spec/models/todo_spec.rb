require 'rails_helper'

RSpec.describe Todo, type: :model do
  context "create new todo" do
    it "should not accept an record with nil title" do
      todo = Todo.new(content: 'somthing')
      expect(todo.valid?).to be_falsy
      
    end

    it "should not accept an record with empty title" do
      todo = Todo.new(title: ' ', content: 'somthing')
      expect(todo.valid?).to be_falsy
    end

    it "should not accept an record with too long title" do
      title = 't'*51;
      todo = Todo.new(title: title, content: 'somthing')
      expect(todo.valid?).to be_falsy
    end

    it "should not accept an record with empty content" do
      todo = Todo.new(title: 'a', content: '')
      expect(todo.valid?).to be_falsy
    end
    
    it "should not accept an record with too long content" do
      content = 'c'*256;
      todo = Todo.new(title: 'a', content: content)
      expect(todo.valid?).to be_falsy
    end
  end
  
end
