require "anomaly_detect/version"
require "anomaly_detect/change_finder"

class AnomalyDetect

  def initialize(options)
    raise ArgumentError, "target is required" unless options[:target]

    default_options = {
      target: nil,
      outlier_term: 28,
      outlier_discount: 0.05,
      smooth_term: 7,
      score_term: 14,
      score_discount: 0.1,
    }
    default_options.each do |k, v|
      instance_variable_set("@#{k}", options[k] || v)
    end

    @outlier_buf = []
    @outlier  = ChangeFinder.new(@outlier_term, @outlier_discount)
    @score    = ChangeFinder.new(@score_term, @score_discount)
  end

  def flush
    flushed = @records
    @records = []

    filtered = flushed.map {|record| record }.compact
    return nil if filtered.empty?
    val = filtered.inject(0) {|result, item| result + item.to_f }.to_f / filtered.size

    outlier = @outlier.next(val)

    @outlier_buf.push outlier
    @outlier_buf.shift if @outlier_buf.size > @smooth_term
    outlier_avg = @outlier_buf.empty? ? 0.0 : @outlier_buf.inject(:+).to_f / @outlier_buf.size

    score = @score.next(outlier_avg)

    {outlier: outlier, score: score, target: val}
  end

  def emit(val)
    @records = [] unless @records
    @records.push val
  end
end
