require 'rails_helper'

RSpec.describe Group do
  context 'context' do
    before do
      @user = User.create(username: 'tester', email: 'mail@mail.com', password: '123456')
      @group = Group.create(name: 'group1', date: '2020-01-01', user_id: @user.id)
      @transaction = Bdraft.create(name: 'transaction1', user_id: @user.id, amount: '150000', group: '1')
    end

    it 'Creates a copy of a existing group' do
      group2 = Group.create(name: 'group1', date: '2020-01-02', user_id: @user.id)
      expect(group2.errors.include?(:name)).to eq(true)
    end

    it 'Recognizes the user linked to the group' do
      expect(@group.user.username).to eq('tester')
    end
  end
end
