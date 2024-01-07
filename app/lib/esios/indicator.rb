module ESIOS
  class Indicator
    include MissingSingleton

    def for_date(date, geo_id = nil)
      if date.is_a?(Range)
        new(
          "start_date" => date.first.beginning_of_day.iso8601, "end_date" => date.last.end_of_day.iso8601,
          "geo_ids[]" => geo_id
        )
      else
        perform_request("datetime" => date.iso8601, "geo_ids[]" => geo_id)
      end
    end

    private

    def base_request
      HTTP
        .headers("Accept" => "application/json; application/vnd.esios-api-v2+json")
        .headers("Content-Type" => "application/json")
        .headers("x-api-key" => ENV.fetch("SOLARIS_ENERGY_PRICE_ESIOS_API_KEY"))
    end

    def perform_request(params = {})
      parse_response(base_request.get(url, params: params.compact))
    end

    def parse_response(response)
      response = response.status.success? ? response.parse : {}

      (response.dig("indicator", "values") || []).map do |value|
        {
          datetime: DateTime.parse(value["datetime"]),
          value: (value["value"] / 1000.0).round(4),
          geo_id: value["geo_id"]
        }
      end
    end
  end
end
