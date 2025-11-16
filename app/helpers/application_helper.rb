module ApplicationHelper
  def errors_for(model, key)
    tag.div(class: "mt-2 form-error") do
      model.errors.messages_for(key).join(", ")
    end
  end

  # From http://railscasts.com/episodes/228-sortable-table-columns?autoplay=true
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = "sortlink"
    css_class += column == sort_column ? " current #{sort_direction}" : ""
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, { sort: column, direction: direction, open: params[:open], closed: params[:closed] },
            { class: css_class }
  end

  def full_title(page_title)
    base_title = "#{Maint::Config::Committee} Maintenance Database"
    if page_title.nil? || page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def bootstrap_class_for(flash_type)
    {success: "alert-success", error: "alert-danger", alert: "alert-warning",
     notice: "alert-info"}[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(_opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
        concat content_tag(:button, "x", class: "close", data: {dismiss: "alert"})
        concat message
      end)
    end
    nil
  end

  def committee
    Maint::Config::Committee
  end
end
