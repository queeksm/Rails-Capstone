require 'rails_helper'

RSpec.describe Bdraft, type: :model do
  context 'context' do
    before do
      @user = User.create(username: 'tester', email: 'mail@mail.com', password: '123456')
      @group = Group.create(name: 'group1', date: '2020-01-01', user_id: @user.id)
      @transaction = Bdraft.create(name: 'transaction1', user_id: @user.id, amount: '150000', group: '1')
    end

    it 'creates a copy of a user' do
      user2 = User.create(username: 'tester', email: 'mail@mail.com', password: '123456')
      expect(user2.errors.include?(:email)).to eq(true)
    end

    it 'creates a copy of a transaction' do
      group2 = Group.create(name: 'group1', date: '2020-01-01', user_id: @user.id)
      expect(group2.errors.include?(:name)).to eq(true)
    end

    it 'creates a copy of a transaction' do
      u1 = User.find(@user.id)
      transaction2 = Bdraft.create(name: 'transaction1', user_id: u1.id, amount: '150000', group: '1')
      expect(transaction2.errors.include?(:name)).to eq(true)
    end

    it 'creates a new transaction group' do
      tg = TransactionGroup.create(group_id: '1', bdraft_id: '1')
      @group.bdrafts.all.each do |trans|
        expect(trans.id).to eq(1) 
      end
      @transaction.groups.all.each do |grp|
        expect(grp.id).to eq(1) 
      end
    end
  end
end
