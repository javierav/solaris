module ESIOS
  class Indicator
    include MissingSingleton

    def for_today
      perform_request
    end

    def for_date(date)
      if date.is_a?(Range)
        perform_request(
          "start_date" => date.first.beginning_of_day.iso8601,
          "end_date" => date.last.end_of_day.iso8601
        )
      else
        perform_request("datetime" => date.iso8601)
      end
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
