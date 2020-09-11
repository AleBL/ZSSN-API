class PercentageInfected
  def percentage
    @result ||= (infected_count/total_count.to_f) * 100

    return 0 if @result.nan?
    @result.round(2)
  end

  private
  
  def infected_count
    @infected_count ||= Person.where(infected: true).count
  end

  def total_count
    @total_count ||= Person.count
  end
end
