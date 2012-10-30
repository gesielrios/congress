module ApplicationHelper
  
  def flash_messages
    #flash.collect do |key, msg|
     # content_tag :p, msg, id: key, class: "flash_message"
    #end.join.html_safe
    render partial: "shared/messages"
  end

  def error_messages_for(resource)
    render partial: "shared/error_messages", locals: { resource: resource }
  end
  
end
