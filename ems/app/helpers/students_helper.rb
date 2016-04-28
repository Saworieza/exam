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
