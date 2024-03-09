# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'custom_assertions'
require_relative '../lib/task1'

class TestTask1 < Minitest::Test
  include CustomAssertions

  def setup
    @task1 = Task1.new([1, 2, 3, 4])
  end

  def test_that_without_threads_works_slow
    results = nil

    assert_runs_longer(4) do
      results = @task1.not_using_threads
    end

    assert_equal results, [2, 4, 6, 8]
  end

  def test_that_with_thread_works_fast
    results = nil
    assert_runs_faster(1.5) do
      results = @task1.using_threads
    end

    assert_equal [2, 4, 6, 8], results, 'using_threads should return array of correct results'
  end
end
