defmodule FreelancerRates do
  @daily_rate 8.0
  def daily_rate(hourly_rate) do
    hourly_rate * @daily_rate
  end

  def apply_discount(before_discount, discount) do
    value_discount = before_discount * (discount / 100)
    before_discount - value_discount
  end

  def monthly_rate(hourly_rate, discount) do
    total_monthly_rate_hour = 22 * @daily_rate

    (hourly_rate * total_monthly_rate_hour)
    |> apply_discount(discount)
    |> ceil()
  end

  defp daily_discounted_rate(hourly_rate, discount) do
    hourly_rate
    |> daily_rate
    |> apply_discount(discount)
  end

  def days_in_budget(budget, hourly_rate, discount) do
    budget / daily_discounted_rate(hourly_rate, discount)
    |> Float.floor(1)
  end
end
