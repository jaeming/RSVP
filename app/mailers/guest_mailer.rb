class GuestMailer < ApplicationMailer

  default from: "daylightsavings@gmail.com"

  def new_rsvp(guest)

    headers["Message-ID"] = "<event/#{guest.event.id}@rsvp.space>"
    headers["In-Reply-To"] = "<guest/#{guest.id}@rsvp.space>"
    headers["References"] = "<guest/#{guest.id}@rsvp.space>"

    @user = guest.event.user
    @event = guest.event
    @guest = guest

    mail(to: guest.email, subject: "RSVP confirmed for #{guest.name}",
         cc: guest.event.user.email)
  end

end
