# Stock Picker
![Ruby CI](https://github.com/<username>/<repo>/actions/workflows/ruby.yml/badge.svg)

## 📌 Overview

This project implements a Ruby method called stock_picker that receives an array of stock prices, one per hypothetical day, and returns the best pair of days to buy and sell to maximize profit.

Return value
------------

The method returns an array with two indices `[buy_day, sell_day]`, or an empty array `[]` when no profitable transaction exists.

Algorithm summary
-----------------

We use a single-pass algorithm (O(n) time) that tracks the minimum price seen so far (`min_price`/`min_day`) and the maximum profit (`max_profit`). For each day we compute the profit if we sold that day and update the best pair when a larger profit is found. On ties, the first profitable pair is kept.

Key points
----------

- Buy must happen before sell.
- Returns `[]` when no profitable trade is possible.
- Time complexity: O(n). Space complexity: O(1).

Examples
--------

```ruby
stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10]) # => [1, 4]
stock_picker([2, 3, 10, 6, 4, 8, 1])         # => [0, 2]
stock_picker([10, 9, 8, 7])                  # => []
```

Testing (RSpec)
----------------

The repository includes specs in `spec/stock_picker_spec.rb`. To run the tests locally:

```bash
bundle install
bundle exec rspec --format documentation
```

How it works (code summary)
--------------------------

1. Initialize `min_price` with the first price and `max_profit = 0`.
2. Iterate prices with index; for each price compute `profit = price - min_price`.
3. If `profit > max_profit`, update `max_profit` and `best_days`.
4. If `price < min_price`, update `min_price` and `min_day`.
5. Return `best_days` if `max_profit` is positive, otherwise return `[]`.
