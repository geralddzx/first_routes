# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  email      :string(255)      not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Contact < ActiveRecord::Base
  validates :name, :user_id, presence: true
  validates :email, presence: true, uniqueness: {scope: :user_id}
  
  belongs_to(
  :owner,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: "User")
  
  has_many(
  :contact_shares,
  primary_key: :id,
  foreign_key: :contact_id,
  class_name: "ContactShare")
  
  has_many(
  :shared_users, through: :contact_shares, source: :owner)
  
  def self.contacts_for_user_id(user_id)
    Contact.find_by_sql([<<-SQL, user_id, user_id])
      SELECT DISTINCT 
        contacts.* 
      FROM 
        contacts 
      LEFT OUTER JOIN 
        contact_shares 
      ON 
        contacts.id = contact_shares.contact_id 
      WHERE 
        contacts.user_id = ? 
      OR 
        contact_shares.user_id = ?
      SQL
  end
    
end
