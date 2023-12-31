###### Challenge:
# Open JSON file & parse the data
# Return JSON: including the average of Market Cap of all companies, Time, and all insurance companies with a Market Cap of over 55 billion
# Ensure the return is organized similar to the input (ie. inside "InsuranceCompanies")
# Then refactor your code

### if time allows:
# Add this insurance company: Marketz & Moneyz (MnM) with 55.1 billion
# return new average along with ins. companies as JSON

require 'json'
require './lib/insurance_companies.rb'

data = File.read('./data/json_ins_data.json')
parsed = JSON.parse(data, symbolize_names: true)

insurance_companies = InsuranceCompanies.new(parsed)

serialized = {
  "InsuranceCompanies": {
    "Time": insurance_companies.time,
    "Average Market Cap": insurance_companies.average_market_cap,
    "Market Cap Over 55 Billion": insurance_companies.over_55_billion
  }
}

data = JSON.pretty_generate(serialized)
File.write('data/json_outs_data.json', data)
