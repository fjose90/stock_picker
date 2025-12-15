def stock_picker(prices)
  return [] if prices.length < 2

  min_price = prices[0]
  min_day = 0

  max_profit = 0
  best_days = []

  prices.each_with_index do |price, day|
    if price < min_price
      min_price = price
      min_day = day
      next
    end

    profit = price - min_price

    if profit > max_profit
      max_profit = profit
      best_days =  [min_day, day]
    end
  end

  best_days
end
