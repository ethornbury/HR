class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def timeout_in
    #admin time out is 2hrs, all others is 1hr
    #if you abandon the application, your session will be closed
    #and you will need to sign in again, more secure
    if self.admin? 
      2.hours
    else
      1.hour
    end
  end 
  
  def admin?
    admin
  end
  
  #def admin_user
  #  redirect_to(root_url) unless current_user.admin?
  #end
end