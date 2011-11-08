class Team < ActiveRecord::Base
  has_many :team_members, :class_name => "TeamMember", :dependent => :destroy
  has_many :members, :source => :user, :through => :team_members
  has_many :membership_requests
  
  validates_presence_of :name
  
  def add_user_with_email(email, current_user_id)
    unless email.blank?
      user = User.find_by_email(email)
      if user
        object = self.team_members.find_or_initialize_by_user_id(:user_id => user.id )
      else
        object = self.membership_requests.find_or_initialize_by_email(:email => email, :sender_id => current_user_id)
      end
      if object.new_record?
        if object.save
          response_status = :created
          if object.is_a?(MembershipRequest)
            notice = "A email sent" if Notifier.invite_member(object).deliver            
          else
            object = user
            notice = "User added"
          end
        else
          error = object.errors
          response_status = :unprocessable_entity
        end
      else
        response_status = :ok
        if object.is_a?(MembershipRequest)
          notice = "another email sent" if Notifier.invite_member(object).deliver
        else
          object = user
          notice = "already user"
        end
      end
    else
      object = nil
      response_status = :unprocessable_entity
      error = "not a blank"
    end
     return { :notice => notice, :error => error }
  end
  
  
end
