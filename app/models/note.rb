class Note < ActiveRecord::Base
  belongs_to :retro
  
  SUCCESS = "Success"
  FAILURE = "Failure"
  
  validates :note_type, :presence => true
  validates :description, :presence => true
end
