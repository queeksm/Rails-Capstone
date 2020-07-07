class PublicController < ApplicationController
  def homepage    
    redirect_to user_index_path if user_signed_in?
  end
end
