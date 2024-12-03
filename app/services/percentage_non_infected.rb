class PercentageNonInfected
  def percentage
    @result ||= (healthy_count / total_count.to_f) * 100

    return 0 if @result.nan?

    @result.round(2)
  end

  private

  def healthy_count
    @healthy_count ||= Person.where(infected: false).count
  end

  def total_count
    @total_count ||= Person.count
  end
end
