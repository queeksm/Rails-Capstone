class GroupController < ApplicationController
  def index
    @groups = Group.all.order('name ASC').includes(:bdrafts)
  end

  def group_transactions
    @groups = Group.find(tra_id)
    @transactions = @groups.bdrafts.all
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
      redirect_to group_index_path, alert: 'Group was not created.'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

  def tra_id
    params[:id]
  end
end
