class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :albums
  has_many :photos, through: :albums

  def self.authenticate(username, password)

    @user = User.find_by(username: username)

    if @user && @user.password == password
      @user

    else
      nil
    end
  end
end
#   def self.authenticate(email, password)
#     if self.where(email: email, self.where(password: password)
#       return self.where(email: email)
#     else
#       return nil
#     end
#   end
# end
