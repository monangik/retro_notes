class Retro < ActiveRecord::Base
  belongs_to :team
  has_many :notes  
  
  validates_presence_of :title  
end
