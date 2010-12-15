require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "task attributes must not be empty" do
    task = Task.new
    assert task.invalid?
    assert task.errors[:task].any?
    assert task.errors[:ready].any?
    assert task.errors[:duedate].any?
  end

end
