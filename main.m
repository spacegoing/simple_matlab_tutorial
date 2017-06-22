% ------------------------- 用户输入 ---------------------
% 用户设定止盈止损线
username = '测试';
low_bound = 1.02;
up_bound = 1.01;

% 购买日期，0就是从当天购买，1就是昨天买，以此类推
start_date = 0;
% 固定收益率
fixed_return = 1.06;
% 购买组合的比例，顺序： 沪深300、中证500、固定收益率
portfolio_weights = [0.1, 0.1, 0.8];
% 总金额
asset = 1e8;

% ------------------------- 导入数据 ---------------------
% 导入数据
% FixMe: 生产环境需要封装成函数，这里为了看着明白、
% 改着方便就没封装
% 目前excel文件名里不要有中文，容易出现字符编码错误问题
% 一定要 xlsx 格式，xls 格式Matlab不能读取
[~,txt_3] = xlsread('000961.xlsx');
[~,txt_5] = xlsread('000962.xlsx');
% price_3 沪深300
price_3 = cellfun(@str2num,txt_3(2:end,2));
dates = cell2mat(txt_3(2:end,1)); % 获取日期
% price_5 中证500
price_5 = cellfun(@str2num,txt_5(2:end,2));
% 一定注意这里数据和 AssetName 顺序一致
Y = [price_3 price_5];

% ------------------------- 开始计算 ---------------------

%% 购买
date = dates(1+start_date,:);
buy_price = Y(1+start_date,:);
buy( username, date, asset, ...
    fixed_return, portfolio_weights, low_bound, up_bound, buy_price);

%% 检查止盈止损
check_bound(username,Y);









