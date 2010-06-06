class User < ActiveRecord::Base

  hobo_user_model # Don't put anything above this

  fields do
    name          :string, :required, :unique
    email_address :email_address, :login => true
		role					Role, :default => :guest, :limit => 20
    timestamps
  end

	conditions = {:foreign_key => 'owner_id',
								:dependent => :destroy, :order => 'created_at DESC'}
	
	has_many :votes, conditions
	has_many :gleps, conditions

  # This gives admin rights to the first sign-up.
  # Just remove it if you don't want that
  before_create do |user|
		if !Rails.env.test? && count == 0
			user.role = :admin
		else
			user.role = :guest
		end
	end

  
  # --- Signup lifecycle --- #

  lifecycle do

    state :active, :default => true

    create :signup, :available_to => "Guest",
           :params => [:name, :email_address, :password, :password_confirmation, :role],
           :become => :active
             
    transition :request_password_reset, { :active => :active }, :new_key => true do
      UserMailer.deliver_forgot_password(self, lifecycle.key)
    end

    transition :reset_password, { :active => :active }, :available_to => :key_holder,
               :params => [ :password, :password_confirmation ]

  end
  

  # --- Permissions --- #

  def create_permitted?
    false
  end

  def update_permitted?
    acting_user.administrator? || 
      (acting_user == self && only_changed?(:email_address, :crypted_password,
                                            :current_password, :password, :password_confirmation))
    # Note: crypted_password has attr_protected so although it is permitted to change, it cannot be changed
    # directly from a form submission.
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

	def administrator?
		role.to_sym == :admin
	end

end
