class InsuranceCompany
  attr_reader :placement,
              :name,
              :market_capitalization

  def initialize(data)
    @placement = data[:No]
    @name = data[:Name]
    @market_capitalization = data[:"Market Capitalization"]
  end

  def capitalization_value
    @market_capitalization.scan(/\d+\.\d+|\d+/).pop.to_f
  end
end
