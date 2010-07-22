module ApplicationHelper
  def tab(label, url_options, html_options = {}, &block)
    if block_given?
	    current = instance_exec(&block) 
    else
      current = url_options.any?{|ops| current_page?(ops)}
    end
    current_class = current ? 'current' : ''
    html_options[:class] = html_options[:class].present? ? html_options[:class] + current_class : current_class
    content = link_to(label, url_options, html_options)
    content_tag(:li, content, :class => current_class)
  end
  
  def spinner(extra = nil)
    e = extra ? "spinner_#{extra}" : 'spinner'
    image_tag('spinner.gif', :id => e, :style => 'display:none', :class => 'spinner')
  end
  
  def reports_for_page
    render :partial => 'layouts/reports', :locals => { :reports => flash }
  end  
end
