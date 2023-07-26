require_relative './insurance_company'

class InsuranceCompanies
  def initialize(data)
    @time = data[:InsuranceCompanies][:Time]
    @top_insurance_companies = objectify_companies(data)

  end

  def average_market_cap
    divisor = @top_insurance_companies.count
    dividend = @top_insurance_companies.map do |company|
      company.capitalization_value
    end.sum
    require 'pry'; binding.pry
  end

  private

  def objectify_companies(data)
    data[:InsuranceCompanies][:"Top Insurance Companies"].map do |company|
      InsuranceCompany.new(company)
    end
  end
end
