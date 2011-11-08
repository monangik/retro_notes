class Notifier < ActionMailer::Base
  default :from => configatron.support.mail

  def invite_member(membership_request)
    @membership_request = membership_request
    mail(:to => @membership_request.email, :subject => "Member invitation")
  end
  
end
