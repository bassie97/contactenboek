module AddressesHelper
  def new_fields_template(f, association, options={})
    options[:object] ||= f.object.class.reflect_on_association(association).klass.new
    options[:partial] ||= association.to_s.singularize + "_fields"
    options[:template] ||= association.to_s + "_fields"
    options[:f] ||= :f

    tmpl = f.fields_for(association, options[:object], :child_index => "new_#{association}") do |b|
      render(:partial => options[:partial], :locals => {:f => b} )
    end

    tmpl = tmpl.gsub(/\n/, '')
    tmpl = tmpl.gsub("'", '"')

    return "<script> var #{options[:template]} = '#{tmpl.to_s}' </script>".html_safe
  end

  def add_child_button(name, association,target)
    "<a class='add_child btn btn-default' data-association='#{target}' target='#{target}'>#{name}</a>".html_safe
  end

  def remove_child_button
    "<div class='input-group-btn'><a class='remove_child btn btn-default'><i class='glyphicon glyphicon-trash'></i></a></div>".html_safe
  end
end
