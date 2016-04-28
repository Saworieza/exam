module StudentsHelper

  def result_programming(student)
    programmings = student.enrollments.collect {|e| exist_result?(e, 'Programming') ? e.result.name : nil }.compact
    return higher_result(programmings)
  end

  def result_communication(student)
    communications = student.enrollments.collect {|e| exist_result?(e, 'Communication') ? e.result.name : nil }.compact
    return higher_result(communications)
  end

  def result_core(student)
    cores = student.enrollments.collect {|e| exist_result?(e, 'Core') ? {exam: e.exam, result: e.result.name} : nil }.compact
    map = {}

    results = {'passed': 2, 'failed': 1, 'noshow': 0}
    cores.each do |core|
      key = "#{core[:exam].exam_type} - #{core[:exam].clazz.name}"
      if map.has_key?(key)
        if results[core[:result]] > results[map[key]]
          map[key] = core[:result]
        end
      else
        map[key] = core[:result]
      end
    end

    map
  end

  def exam_type_list(selected)
    options = Exam::EXAM_TYPE_LIST.collect do |exam_type|
      content_tag(:option, exam_type, exam_type == selected ? { value: exam_type, selected: 'selected' } : { value: exam_type })
    end
    options.join('').html_safe
  end

  def clazz_list(selected)
    options = Group.order(:name).collect do |group|
      content_tag(:optgroup, label: group.name) do
        group.clazzs.collect do |clazz|
          concat content_tag(:option, clazz, clazz.id == selected ? { value: clazz.id, selected: 'selected' } : { value: clazz.id })
        end
      end
    end
    options.join('').html_safe
  end

  def result_search_radio_button(group, result, selected = nil)
    if selected.present? and selected == result
      input = content_tag(:input, nil, class: 'with-gap', name: group, type: 'radio', id: "#{group}-#{result}", value: result, checked: 'checked')
    else
      input = content_tag(:input, nil, class: 'with-gap', name: group, type: 'radio', id: "#{group}-#{result}", value: result)
    end
    label = content_tag(:label, for: "#{group}-#{result}") do
      result
    end

    input + label
  end

  private

    def exist_result?(enrollment, exam_type)
      enrollment.exam.exam_type == exam_type and enrollment.exam.published? and enrollment.result.present?
    end

    def higher_result(results)
      if !results.empty?
        return 'passed' if results.include?('passed')
        return 'failed' if results.include?('failed')
        return 'noshow' if results.include?('noshow')
      end
      return ''
    end
end
