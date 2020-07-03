class GroupController < ApplicationController
  def index
    @groups = Group.all
  end

  def group_transactions
    @groups = Group.find(params[:id])
    @transactions =  @groups.bdrafts.all
  end

  def new   
    @group = Group.new
  end 

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id

    if @group.save
      redirect_to group_index_path, alert: 'Group was successfully created.'
    else
      redirect_to group_index_path, alert: 'Post was not created.'
    end
  end
  
  def group_params
    params.require(:group).permit(:name, :date)
  end
  
  
end
