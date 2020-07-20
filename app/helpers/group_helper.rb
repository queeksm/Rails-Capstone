module GroupHelper
  def group_total(group)
    sum = 0
    group.bdrafts.each do |t|
      sum += t.amount
    end
    sum
  end
end
