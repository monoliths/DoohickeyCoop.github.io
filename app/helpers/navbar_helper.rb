module NavbarHelper
  def navbar_link_class(path)
    if request.original_url.ends_with?(path)
      'nav-item active'
    else
      'nav-item'
    end
  end
end