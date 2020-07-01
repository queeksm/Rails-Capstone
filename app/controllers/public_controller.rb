class PublicController < ApplicationController

  def homepage
    if user_signed_in?
      redirect_to user_index_path
    end
    
  end
  
end
