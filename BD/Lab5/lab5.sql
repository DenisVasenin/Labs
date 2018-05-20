-- 2) Выдать информацию по всем заказам лекарства “Кордерон” компании “Аргус” с указанием названий аптек, дат, объема заказов. ++

SELECT company.company_name, drug.drug_name, pharmacy.pharmacy_name, drug_order.drug_order_date, drug_order.quantity 
FROM drug_order
LEFT JOIN consignment ON drug_order.consignment_id = consignment.consignment_id
LEFT JOIN drug ON consignment.drug_id = drug.drug_id
LEFT JOIN company ON consignment.company_id = company.company_id
LEFT JOIN pharmacy ON drug_order.pharmacy_id = pharmacy.pharmacy_id
WHERE company.company_name = 'Аргус' AND drug.drug_name = 'Кордерон';


-- 3) Дать список лекарств компании “Фарма”, на которые не были сделаны заказы до 1.05.12.

SELECT drug.drug_name, MIN(drug_order.drug_order_date) FROM drug
LEFT JOIN consignment ON drug.drug_id = consignment.drug_id
LEFT JOIN company ON consignment.company_id = company.company_id
LEFT JOIN drug_order ON consignment.consignment_id = drug_order.consignment_id
WHERE company.company_name = 'Фарма'
GROUP BY drug_order.drug_order_date
HAVING MIN(drug_order.drug_order_date) > '1.05.12' OR drug_order.drug_order_date = NULL;


-- 4) Дать минимальный и максимальный баллы по лекарствам каждой фирмы, которая производит не менее 100 препаратов, с указанием названий фирмы и лекарства.

SELECT company.company_name, drug.drug_name, MIN(consignment.drug_rating) as min_rating, MAX(consignment.drug_rating) as max_rating FROM consignment 
LEFT JOIN company ON consignment.company_id = company.company_id
LEFT JOIN drug ON consignment.drug_id = drug.drug_id
GROUP BY company.company_name
HAVING COUNT(*) > 5;


-- 5) Дать списки сделавших заказы аптек по всем дилерам компании “Гедеон Рихтер”. Если у дилера нет заказов, в названии аптеки проставить NULL. ++

SELECT pharmacy.pharmacy_name, dealer.dealer_surname, company.company_name FROM dealer
LEFT JOIN company ON dealer.company_id = company.company_id
LEFT JOIN drug_order ON dealer.dealer_id = drug_order.dealer_id
LEFT JOIN pharmacy ON drug_order.pharmacy_id = pharmacy.pharmacy_id
WHERE company.company_name = 'Гедеон Рихтер';


-- 6) Уменьшить на 20% стоимость всех лекарств, если она превышает 3000, а длительность лечения не более 7 дней. ++

UPDATE consignment
LEFT JOIN drug ON consignment.drug_id = drug.drug_id
SET consignment.drug_price = consignment.drug_price * 0.8
WHERE (consignment.drug_id = drug.drug_id AND drug.treatment_duration <= 7 AND consignment.drug_price > 3000);