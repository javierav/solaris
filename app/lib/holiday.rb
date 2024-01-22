class Holiday
  def self.all
    @all ||= new.all
  end

  def all
    (year2023 + year2024).map { |date| Date.parse(date) }
  end

  private

  def year2023
    %w[2023-01-06 2023-05-01 2023-08-15 2023-10-12 2023-11-01 2023-12-06 2023-12-08 2023-12-25]
  end

  def year2024
    %w[2024-01-01 2024-01-06 2024-05-01 2024-08-15 2024-10-12 2024-11-01 2024-12-06 2024-12-25]
  end
end
