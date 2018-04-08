module NavbarHelper
  def nav_item(title, path, options={})
    defaults = {
      method: :get,
      content_tag: :li
    }
    options = defaults.merge(options)
    class_names = "nav-item#{' active' if request.path.eql?(path)}"

    content_tag options[:content_tag], class: class_names do
      link_to title, path, class: 'nav-link', method: options[:method]
    end
  end
end
