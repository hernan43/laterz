module CategoriesHelper
  def generate_category_shortcut_link(category=nil)
    category_id_stub = ""
    alt_text = "save this"
    
    if category
      category_id_stub = "&amp;category_id=#{category.id}"
      alt_text = "save this to #{h(category.name)}"
    end
    link_text = image_tag("icons/wrench.png", :alt => alt_text)
    
    "<a href=\"javascript:void(location.href='#{new_link_url}?return=true#{category_id_stub}&amp;url='+encodeURIComponent(location.href))\" onmouseover=\"window.status='';return true\" onclick=\"return false\">#{link_text}</a>"
  end
end
