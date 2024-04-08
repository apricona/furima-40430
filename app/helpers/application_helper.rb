module ApplicationHelper
  def sold_out?(item)
    return false unless item.present?
    Order.exists?(item_id: item.id)
  end
end
