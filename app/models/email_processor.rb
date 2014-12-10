class EmailProcessor

  def initialize(email)
    @email = email
  end

  def process
    user = User.find_by(email: @email.from[:email])
    if user
        link = @email.body
        pricemark = user.pricemarks.new(url: link)
        tags = @email.subject.split.map {|tag| tag.sub(/\A#/, '') }
        tags.each {|tag| pricemark.tag_list.add(tag)}
      
        pricemark.save
    #else
      #respond_email_once_to_unregistered_user
    end
  end

  #def respond_email_once_to_unregistered_user
   # unsigned_up_user = UnsignedUpUser.find_by(email: @email.from[:email])
   # unless unsigned_up_user
    #  user = UnsignedUpUser.create(name: @email.from[:name], email: @email.from[:email])
     # user.send_email
    #end
  #end

end