class CreateMembershipRequests < ActiveRecord::Migration
  def change
    create_table :membership_requests do |t|
      t.integer :sender_id
      t.integer :team_id
      t.string :email
      t.string :token
    end    
  end
end
