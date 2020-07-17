require 'rails_helper'

RSpec.describe 'Application', type: :feature, js: true do
  context 'context' do
    before do
      Capybara.run_server = true 
      Capybara.server_port = 7000
      Capybara.app_host = 'http://localhost:#{Capybara.server_port}' 
      @user = User.create(username: 'tester', email: 'mail@mail.com', password: '123456')
      @group = Group.create(name: 'group1', date: '2020-01-01', user_id: @user.id)
      @transaction = Bdraft.create(name: 'transaction1', user_id: @user.id, amount: '150000', group: '1')
      @transaction2 = Bdraft.create(name: 'transactionEmpty', user_id: @user.id, amount: '150000', group: '')
      @tg = TransactionGroup.create(group_id: @group.id, bdraft_id: @transaction.id)
      visit 'http://localhost:7000'
      click_on 'Log In'
      visit 'http://localhost:7000/users/sign_in'
      fill_in 'Email',	with: 'mail@mail.com'
      fill_in 'Password',	with: '123456'
      click_on 'Log in'      
    end
    
    scenario 'Log in' do      
      expect(page).to have_content('Welcome') 
    end

    scenario 'Transaction functionality' do
      click_on 'All my transactions'
      expect(page).to have_content('transaction1')
      click_on 'Add new'
      fill_in 'Name',	with: 'transaction2'
      fill_in 'Date',	with: '07/16/2020'
      fill_in 'Amount', with: '10000'
      select 'group1', from: 'Group'
      click_on 'Create'
      expect(page).to have_content('transaction2')
      first(:link, 'Edit').click
      fill_in 'Name',	with: 'transaction3'
      click_on 'Edit'
      expect(page).to have_content('transaction3')
      first(:link, 'Delete').click
      accept_confirm('Really want to delete the transaction') do
        sleep(1)
      end
      expect(page).not_to have_content('transaction3')
    end

    scenario 'External transactions functionality' do
      click_on 'All my external transactions'
      sleep(1)
      expect(page).to have_content('transactionEmpty')
      click_on 'Add new'
      fill_in 'Name',	with: 'transactionEmpty2'
      fill_in 'Date',	with: '07/16/2020'
      fill_in 'Amount', with: '10000'
      select '', from: 'Group'
      click_on 'Create'
      expect(page).to have_content('transactionEmpty2')
      first(:link, 'Edit').click
      fill_in 'Name',	with: 'transactionEmpty3'
      click_on 'Edit'
      expect(page).to have_content('transactionEmpty3')
      first(:link, 'Delete').click
      accept_confirm('Really want to delete the transaction') do
        sleep(1)
      end            
      expect(page).not_to have_content('transactionEmpty2')
      click_on 'Edit'
      select 'group1', from: 'Group'
      click_on 'Edit'
      expect(page).to have_content('transactionEmpty3')
      expect(page).to have_content('transaction1')
    end
  end  
end