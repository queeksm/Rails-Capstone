class BdraftController < ApplicationController
  def index
    @transactions = Bdraft.where(user_id: current_user.id).order('created_at DESC')
    @sum = 0
    @transactions.each do |trans|
      @sum += trans.amount
    end
  end

  def external
    @transactions = Bdraft.where(user_id: current_user.id)
    @etransactions = @transactions.where(group: nil)
  end

  def new
    @transaction = Bdraft.new
    @groups = Group.all
  end

  def create
    @transaction = Bdraft.new(bdraft_params)
    @transaction.user_id = current_user.id

    if @transaction.save
      if !@transaction.group.nil?
        tg = TransactionGroup.new
        tg.group_id = @transaction.group
        tg.bdraft_id = @transaction.id
        tg.save
      end
    end
    redirect_to bdraft_index_path
  end

  def bdraft_params
    params.require(:bdraft).permit(:name, :date, :group, :amount)
  end
end
