module ExamsHelper
  def total_results(exam, result)
    exam.enrollments.reject { |e| e.result.nil? or e.result.name != result }.size
  end

  def result_radio_button(enrollment, result, selected = nil)
    group = "result[#{enrollment.id}]"

    if selected.present? and selected.name == result
      input = content_tag(:input, nil, class: 'with-gap', name: group, type: 'radio', id: "#{group}-#{result}", value: result, checked: 'checked')
    else
      input = content_tag(:input, nil, class: 'with-gap', name: group, type: 'radio', id: "#{group}-#{result}", value: result)
    end
    label = content_tag(:label, for: "#{group}-#{result}") do
      result
    end

    input + label
  end
end
