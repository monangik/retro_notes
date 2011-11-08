class MembershipRequest < ActiveRecord::Base
  belongs_to :team
  belongs_to :sender, :class_name => 'User'
  
  validates :email, :presence   => true, :format => { :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i }
end
