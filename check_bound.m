function check_bound(username, Y)
%CHECK_BOUND Summary of this function goes here
%   Detailed explanation goes here

if (exist('user_database.mat','file'))
    load user_database
    if (user_file.isKey(username))
        user_data = user_file(username);
    else
        display('用户没有购买记录，请先购买');
    end
else
    display('数据库不存在，请先购买')
    return;
end

weights = user_data('portfolio_weights');
asset = user_data('asset');
buy_price = user_data('buy_price');
fixed_return = user_data('fixed_return');

return_rate = [(Y(1,:)-buy_price)./buy_price fixed_return-1]* weights';

low_bound = user_data('low_bound');
up_bound = user_data('up_bound');

if (return_rate+1 < low_bound)
    display('仓位低于止损线，请平仓')
    return;
else if (return_rate+1 > up_bound)
    display('仓位高于止盈线，请平仓')
    return;
    end
end

display('仓位正常，请继续持有');

end
