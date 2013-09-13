module BooksHelper
  def field_class(resource, field_name)
    if resource.errors[field_name].present?
      return "error".html_safe
    else
      return "noerror".html_safe
    end
  end
end
