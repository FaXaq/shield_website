module ApplicationHelper
  def size_from_image_style(style)
    return style[/\d+/]
  end
end
