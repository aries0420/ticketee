module ApplicationHelper
  def title(*parts) #<co id="ch03_790_1"/>
    unless parts.empty?
      content_for :title do
        (parts << "Ticketee").join(" - ")
      end
    end
  end

  def admins_only(&block)
    # concat(block.call) if current_user.try(:admin?)
    (block.call) if current_user.try(:admin?)
  end
end
