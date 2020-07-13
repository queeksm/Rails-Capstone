module BdraftHelper
  def bdraft_indexer(transaction)
      content = (('<div class = "pr-2">' +  'Name: ' + (transaction.name) + '</div>'))
      content.concat(('<div class = "pr-2">' +  'Amount: ' + (transaction.amount).to_s + '</div>'))
      content.concat(('<div class = "pr-2">' +  'Date: ' + (transaction.date).to_s + '</div>'))
      content.concat(('<div class = "pr-2">' +  'Group: ' + (transaction.groups.first.name) + '</div>'))      
      content.html_safe
  end
end
