require_relative './insurance_company'

class InsuranceCompanies
  attr_reader :time

  def initialize(data)
    @time = data[:InsuranceCompanies][:Time]
    @top_insurance_companies = objectify_companies(data)

  end

  def average_market_cap
    divisor = @top_insurance_companies.count
    dividend = @top_insurance_companies.map do |company|
      company.capitalization_value
    end.sum
    "$#{(dividend / divisor).truncate(1)} billion"
  end

  def over_55_billion
    subset = @top_insurance_companies.find_all { |c| c.capitalization_value > 55.0 }
    format(subset)
  end

  private

  def objectify_companies(data)
    data[:InsuranceCompanies][:"Top Insurance Companies"].map do |company|
      InsuranceCompany.new(company)
    end
  end

  def format(data)
    collection = []

    for company in data
      company_data = {
        "No": company.placement,
        "Name": company.name,
        "Market Capitalization": company.market_capitalization
      }
      collection.push(company_data)
    end

    return collection
  end
end
