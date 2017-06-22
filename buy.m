function  [] = buy( username, date, asset, ...
    fixed_return, portfolio_weights, low_bound, up_bound, buy_price)
%BUY Summary of this function goes here
%   Detailed explanation goes here

% 存储数据
user_file = containers.Map();
user_data = containers.Map();
user_data('portfolio_weights') = portfolio_weights;
user_data('date') = date;
user_data('asset') = asset;
user_data('low_bound') = low_bound;
user_data('up_bound') = up_bound;
user_data('fixed_return') = fixed_return;
user_data('buy_price') = buy_price;
user_file(username) = user_data;

save user_database user_file;

end

