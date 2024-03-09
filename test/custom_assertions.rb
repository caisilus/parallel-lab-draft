module CustomAssertions
  def assert_runs_longer(seconds, &block)
    start_time = Time.now

    block.call

    end_time = Time.now

    ellapsed_time = end_time - start_time

    assert_operator ellapsed_time, :>, seconds,
                    "Method should run longer than #{seconds} seconds. It ran #{ellapsed_time}"
  end
end
