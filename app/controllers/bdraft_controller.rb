class BdraftController < ApplicationController
  def index
    @transactions = Bdraft.where(user_id: current_user.id).where.not(group: nil).includes(:groups).order('created_at DESC')
    @sum = 0
    @transactions.each do |trans|
      @sum += trans.amount
    end
  end

  def external
    @transactions = Bdraft.where(user_id: current_user.id).where(group: nil)    
  end

  def new
    @transaction = Bdraft.new
    @groups = Group.all
  end

  def edit
    @transaction = Bdraft.find(ed_id)
  end

  def update
    @transaction = Bdraft.find(ed_id)
    @transaction.update(bdraft_params)
    transGrou = TransactionGroup.all
    @tg = transGrou.where(bdraft_id: ed_id)
    if @tg.nil?
      unless @transaction.group.nil?
        tg = TransactionGroup.new
        tg.group_id = @transaction.group
        tg.bdraft_id = @transaction.id
        tg.save
      end
    else      
      @tg.each do |tg|
        tg.destroy
      end
      unless @transaction.group.nil?
        tg = TransactionGroup.new
        tg.group_id = @transaction.group
        tg.bdraft_id = @transaction.id
        tg.save
      end      
    end

    if @transaction.group.nil?
      redirect_to external_path
    else
      redirect_to bdraft_index_path
    end
  
    
  end
  
  def destroy
    @transaction = Bdraft.find(ed_id)
    @transaction.destroy
    transGrou = TransactionGroup.all
    @tg = transGrou.where(bdraft_id: ed_id)

    if @tg.nil?
      redirect_to bdraft_index_path
    else      
      @tg.each do |tg|
        tg.destroy
      end
      if @transaction.group.nil?
        redirect_to external_path
      else
        redirect_to bdraft_index_path
      end
    end    
  end
  

  def create
    @transaction = Bdraft.new(bdraft_params)
    @transaction.user_id = current_user.id
    if @transaction.save
      unless @transaction.group.nil?
        tg = TransactionGroup.new
        tg.group_id = @transaction.group
        tg.bdraft_id = @transaction.id
        tg.save
      end
    end
    if @transaction.group.nil?
      redirect_to external_path
    else
      redirect_to bdraft_index_path
    end
  end
  
  private

  def bdraft_params
    params.require(:bdraft).permit(:name, :date, :group, :amount)
  end

  def ed_id
    params[:id]
  end
  
end
