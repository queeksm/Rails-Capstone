module BdraftHelper
  def redirecter(transaction)
    if transaction.group.nil?
      (link_to 'Back', external_path, class: 'btn bg-green btn-block align-center').html_safe
    else
      (link_to 'Back', bdraft_index_path, class: 'btn bg-green btn-block align-center').html_safe
    end
  end
end
