class Todo < ApplicationRecord
  validates_presence_of :name, :due_date 
  validate :due_date_validation, if: :due_date.presence

  private
  def due_date_validation
    errors.add(:due_date, "can't be in the past!") if due_date.past?
  end
end
