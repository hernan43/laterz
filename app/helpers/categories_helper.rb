module CategoriesHelper
  def generate_category_shortcut_link(category=nil)
    # <a href="javascript:void(location.href='<%= new_link_url %>?return=true&amp;url='+encodeURIComponent(location.href))"  onmouseover="window.status='';return true" onclick="return false">save this</a>
    category_id_stub = ""
    text = "save this"
    
    if category
      category_id_stub = "&amp;category_id=#{category.id}"
      text = "save this to #{h(category.name)}"
    end
    "<a href=\"javascript:void(location.href='#{new_link_url}?return=true#{category_id_stub}&amp;url='+encodeURIComponent(location.href))\" onmouseover=\"window.status='';return true\" onclick=\"return false\">#{text}</a>"
  end
end
