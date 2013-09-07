module BooksHelper
  def field_class(resource, field_name)
    if resource.errors[field_name].present?
      return "error listalign".html_safe
    else
      return "noerror listalign".html_safe
    end
  end
end
