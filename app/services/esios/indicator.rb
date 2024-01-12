module ESIOS
  class Indicator
    def self.for_today
      for_date(Date.current)
    end

    def self.for_date(date)
      new.for_date(date.is_a?(Range) ? date : [date])
    end

    def for_date(date)
      perform_request(
        {
          "start_date" => date.first.beginning_of_day.iso8601,
          "end_date" => date.last.end_of_day.iso8601
        }
      )
    end

    private

    def base_request
      HTTP
        .headers("Accept" => "application/json; application/vnd.esios-api-v2+json")
        .headers("Content-Type" => "application/json")
        .headers("x-api-key" => Rails.application.config.x.esios.api_key)
    end

    def base_params
      { "geo_ids[]" => geo_id }
    end

    def url
      "https://api.esios.ree.es/indicators/#{indicator_id}"
    end

    def perform_request(params = {})
      parse_response(base_request.get(url, params: base_params.merge(params)))
    end

    def parse_response(response)
      response = response.status.success? ? response.parse : {}

      (response.dig("indicator", "values") || []).to_h do |value|
        [
          DateTime.parse(value["datetime"]),
          (value["value"] / 1000.0).round(4)
        ]
      end
    end
  end
end
