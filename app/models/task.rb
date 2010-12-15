class Task < ActiveRecord::Base
  validates :task, :ready, :duedate, :presence => true
end
