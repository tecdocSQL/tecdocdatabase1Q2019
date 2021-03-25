/*
	поиск комплекта ремня ГРМ (Timing Belt Set) на FORD FUSION (JU_) 1.4
*/

-- поиск id производителя "ford"
SELECT *
FROM manufacturers m
WHERE
  m.IsPassengerCar = 1
  and m.CanBeDisplayed = 1
  and m.Matchcode = "ford"
-- id = 36

-- поиск моделей производителя "ford"
SELECT *
FROM models m
WHERE
	m.IsPassengerCar = 1
	and m.CanBeDisplayed = 1
	and m.ManufacturerId = 36
-- FUSION (JU_) id = 4885

-- поиск id модели FORD FUSION (JU_) 1.4
SELECT *
FROM passengercars p
WHERE
p.model = 4885
and p.CanBeDisplayed = 1
-- FORD FUSION (JU_) 1.4 id = 16624, internalID = 20324

  /* типы деревьев продуктов
  1-PassengerCar
  2-CommercialVehicle
  3-Engine
  4-Universal
  11-Axle
  12-CVManufacturer
  14-Motorbike*/

-- поиск internalID продукта "Комплект ремней ГРМ" (Timing Belt Set)
-- получим дерево продуктов для конкретной модификации автомобиля, коммерческого автомобиля или мотоцикла
SELECT
q1.parent_node_id,
q1.node_id,
st.Description,
p.internalID AS product_id
FROM
(
	SELECT *
	FROM tree_node_products tnp
	WHERE
	tnp.tree_id = 1 -- id дерева для пассажирских автомобилей
	AND tnp.itemId = 16624 -- id модификации из предыдущего запроса
	AND tnp.valid_state = 1
) q1
LEFT JOIN search_trees st ON st.tree_id = 1 AND st.node_id = q1.node_id
LEFT JOIN products p ON p.ID = q1.product_id
-- where st.Description = 'Timing Belt Set'
-- "Timing Belt Set" product_id = 260 и 2593
-- один и тот же продукт может находится в нескольких ветвях дерева

-- поиск поставщиков и их артикулов
SELECT s.MatchCode AS Supplier, ar.article, ar.linkages_attributes
FROM (
	SELECT
		supplier, article, linkages_attributes
	FROM articles_linkages al
	WHERE
		al.item_type = 1 -- типы соответствуют типам деревьев продуктов указанным выше, 1-PassengerCar, 2-CommercialVehicle и тд.
		AND al.item = 20324 -- internalID из запроса к таблице passengercars
		AND al.product IN (260, 2593) -- internalID из предыдущего запроса
) ar
LEFT JOIN suppliers s ON ar.supplier = s.internalID
INNER JOIN articles a ON a.Supplier = s.id AND a.DataSupplierArticleNumber = ar.article
WHERE a.IsValid = 1
ORDER BY Supplier
-- поле linkages_attributes к сожалению на немецком языке, его формат: title$$value##title$$value##title$$value...
  
/*
	поиск заменителей артикула 17007 (тормозной диск) на FORD FUSION (JU_) 1.4
	неоригинал на неоригал
	на каждый артикул может быть найдено не более 100 замен
*/

-- поиск id артикула 17007
SELECT a.id, p.Description
FROM articles a
LEFT JOIN products p
	ON p.ID = a.CurrentProduct
WHERE a.DataSupplierArticleNumber = '17007'
AND IsValid = 1
-- Description = Тормозной диск (Brake Disc)
-- id = 43029

-- поиск заменителей артикула (поставщиков и их артикулов)
SELECT
    p.Description ProductGroup, s.MatchCode Supplier, acl.Article
FROM article_cross_list acl
LEFT JOIN suppliers s
    ON s.id = acl.supplier
LEFT JOIN articles a
    ON a.Supplier = acl.supplier AND a.DataSupplierArticleNumber = acl.Article
LEFT JOIN products p
    ON p.ID = a.CurrentProduct
WHERE
    acl.article_id = 43029 -- id искомого артикула
	AND a.IsValid = 1
    AND p.Description = "Brake Disc" -- искомая товарная группа
ORDER BY Supplier

