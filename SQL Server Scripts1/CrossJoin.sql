select * from sales.SpecialOffer

select * from sales.SpecialOfferCustomer

select * from sales.SpecialOfferReseller

select C.Description, R.Description, C.DiscountPct, R.DiscountPct, C.DiscountPct+R.DiscountPct as DiscountPctTotal
from sales.SpecialOfferCustomer C
CROSS JOIN sales.SpecialOfferReseller R

