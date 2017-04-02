class Users::RegistrationsController < Devise::RegistrationsController
  #Extend default Devise gem behavior so that
  #Users signing up with Pro Account (plan id 2)
  #Save with a special subscription function.
  #Otherwise Devise signs up user as usual. 
  def create
    super do |resource|
      if params[:plan]
        resource.plan_id = params[:plan]
        if resource.plan_id == 2
          resource.save_with_subscription
        else
          resource.save
        end
      end
    end
  end
end