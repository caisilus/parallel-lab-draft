module CustomAssertions
  def assert_runs_longer(seconds, &block)
    assert_runs(:>, seconds, &block)
  end

  def assert_runs_faster(seconds, &block)
    assert_runs(:<, seconds, &block)
  end

  private

  def assert_runs(sym, seconds, &block)
    start_time = Time.now

    block.call

    end_time = Time.now

    ellapsed_time = end_time - start_time

    assert_operator ellapsed_time, sym, seconds,
                    "Method should run #{sym} than #{seconds} seconds. It ran #{ellapsed_time}"
  end
end
