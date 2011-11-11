class Retro < ActiveRecord::Base
  belongs_to :team
  
  validates_presence_of :title  
end
