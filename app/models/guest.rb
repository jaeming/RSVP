class Guest < ActiveRecord::Base
  belongs_to :event

  after_create :send_favorite_emails

   private

   def send_favorite_emails
    GuestMailer.new_rsvp(self).deliver_now
   end
end
