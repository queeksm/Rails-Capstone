require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context 'context' do
    before do
      @user = User.create(email: 'mail@mail.com', password: '123456')
    end

    it 'creates a new transaction with' do
      
    end
  end
end
