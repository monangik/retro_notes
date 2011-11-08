class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :theme_id
  after_create :add_to_team
  
  belongs_to :theme
  has_many :team_members, :foreign_key => 'user_id'
  has_many :teams, :through => :team_members
  has_many :membership_requests, :class_name => 'MembershipRequest', :foreign_key => 'sender_id'
  
  protected 
    def add_to_team
      membership_requests = MembershipRequest.where(:email => self.email)
      unless membership_requests.blank?
        membership_requests.each do |membership_request|
          self.team_members.find_or_create_by_team_id(membership_request.team_id)
          membership_request.destroy
        end
      end
    end  
end
