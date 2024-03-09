# frozen_string_literal: true

require_relative 'parallel_tasks'

class Task1
  include ParallelTasks

  def initialize(elements)
    @elements = elements
  end

  def not_using_threads
    @elements.map { |el| slow_io_task(el) }
  end

  def using_threads
    nil
  end
end
