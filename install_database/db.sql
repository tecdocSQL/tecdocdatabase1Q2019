

/*!40101 SET NAMES utf8mb4 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `article_accessory_list_parents` */

DROP TABLE IF EXISTS `article_accessory_list_parents`;

CREATE TABLE `article_accessory_list_parents` (
  `article_id` int(11) unsigned DEFAULT NULL,
  `ArticleParentNbr` varchar(255) DEFAULT NULL,
  `Supplier` int(11) unsigned DEFAULT NULL,
  KEY `IX_article_accessory_list_parents_article_id` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `article_accessory_lists` */

DROP TABLE IF EXISTS `article_accessory_lists`;

CREATE TABLE `article_accessory_lists` (
  `article_id` int(11) unsigned DEFAULT NULL,
  `Article` varchar(255) DEFAULT NULL,
  `Supplier` int(11) unsigned DEFAULT NULL,
  `Quantity` decimal(10,2) DEFAULT NULL,
  `Description` text,
  KEY `IX_article_accessory_lists_article_id` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='аксессуары артикула';

/*Table structure for table `article_attributes` */

DROP TABLE IF EXISTS `article_attributes`;

CREATE TABLE `article_attributes` (
  `article_id` int(11) unsigned DEFAULT NULL,
  `attribute_id` smallint(6) unsigned DEFAULT NULL,
  `AttributeInformationType` varchar(255) DEFAULT NULL,
  `DisplayTitle` varchar(255) DEFAULT NULL,
  `DisplayValue` varchar(255) DEFAULT NULL,
  `ShowImmediately` tinyint(1) DEFAULT NULL,
  `AttributeType` varchar(255) DEFAULT NULL,
  KEY `IX_article_attributes_article_id` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='атрибуты артикула';

/*Table structure for table `article_cross_list` */

DROP TABLE IF EXISTS `article_cross_list`;

CREATE TABLE `article_cross_list` (
  `article_id` int(10) unsigned DEFAULT NULL,
  `supplier` int(10) unsigned DEFAULT NULL,
  `Article` varchar(255) DEFAULT NULL,
  KEY `IX_article_cross_list_article_id` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='варианты замены артикула (кроссы)';

/*Table structure for table `article_ea_numbers` */

DROP TABLE IF EXISTS `article_ea_numbers`;

CREATE TABLE `article_ea_numbers` (
  `article_id` int(11) unsigned DEFAULT NULL,
  `EAN` varchar(255) DEFAULT NULL,
  KEY `IX_article_ea_numbers_article_id` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='штрихкоды';

/*Table structure for table `article_informations` */

DROP TABLE IF EXISTS `article_informations`;

CREATE TABLE `article_informations` (
  `article_id` int(11) unsigned DEFAULT NULL,
  `InformationText` text,
  `ShowImmediately` tinyint(1) DEFAULT NULL,
  `InformationType` varchar(255) DEFAULT NULL,
  `InformationTypeKey` int(11) unsigned DEFAULT NULL,
  KEY `IX_article_informations_article_id` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='информация об артикуле';

/*Table structure for table `article_mediainformation` */

DROP TABLE IF EXISTS `article_mediainformation`;

CREATE TABLE `article_mediainformation` (
  `article_id` int(11) unsigned DEFAULT NULL,
  `DocumentType` varchar(255) DEFAULT NULL,
  `AdditionalDescription` text,
  `ShowImmediately` tinyint(1) DEFAULT NULL,
  `TecdocHyperlinkName` varchar(255) DEFAULT NULL,
  `TopmotiveHyperlinkName` varchar(255) DEFAULT NULL,
  `NormedDescriptionID` int(11) DEFAULT NULL,
  `DocumentName` varchar(255) DEFAULT NULL,
  `PictureName` varchar(255) DEFAULT NULL,
  `Description` text,
  KEY `IX_article_mediainformation_article_id` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='информация о названии файла изображения или url pdf файла';

/*Table structure for table `article_new_numbers` */

DROP TABLE IF EXISTS `article_new_numbers`;

CREATE TABLE `article_new_numbers` (
  `article_id` int(11) unsigned DEFAULT NULL,
  `NewNbr` varchar(255) DEFAULT NULL,
  `Supplier` int(11) unsigned DEFAULT NULL,
  KEY `IX_article_new_numbers_article_id_supplier` (`article_id`,`Supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='новые номера артикула';

/*Table structure for table `article_oe_numbers` */

DROP TABLE IF EXISTS `article_oe_numbers`;

CREATE TABLE `article_oe_numbers` (
  `article_id` int(11) unsigned DEFAULT NULL,
  `OENbr` varchar(255) DEFAULT NULL,
  `IsAdditive` tinyint(1) DEFAULT NULL,
  `Manufacturer` int(11) unsigned DEFAULT NULL,
  `ReferenceInformation` text,
  KEY `IX_article_oe_numbers_article_id_manufacturer` (`article_id`,`Manufacturer`),
  KEY `IX_Manufacturer_ORNbr` (`Manufacturer`,`OENbr`),
  KEY `IX_OENbr` (`OENbr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='оригинальные номера артикула';

/*Table structure for table `article_parts_list` */

DROP TABLE IF EXISTS `article_parts_list`;

CREATE TABLE `article_parts_list` (
  `article_id` int(11) unsigned DEFAULT NULL,
  `Article` varchar(255) DEFAULT NULL,
  `Supplier` int(11) unsigned DEFAULT NULL,
  `SequenceID` int(11) unsigned DEFAULT NULL,
  `Quantity` decimal(10,2) DEFAULT NULL,
  KEY `IX_article_parts_list_article_id_supplier` (`article_id`,`Supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='составные элементы артикула';

/*Table structure for table `article_parts_list_parents` */

DROP TABLE IF EXISTS `article_parts_list_parents`;

CREATE TABLE `article_parts_list_parents` (
  `article_id` int(11) unsigned DEFAULT NULL,
  `ArticleParentNbr` varchar(255) DEFAULT NULL,
  `Supplier` int(11) unsigned DEFAULT NULL,
  KEY `IX_article_parts_list_parents_article_id_supplier` (`article_id`,`Supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `article_replace_numbers` */

DROP TABLE IF EXISTS `article_replace_numbers`;

CREATE TABLE `article_replace_numbers` (
  `article_id` int(11) unsigned DEFAULT NULL,
  `ReplaceNbr` varchar(255) DEFAULT NULL,
  `Supplier` int(11) unsigned DEFAULT NULL,
  KEY `IX_article_replace_numbers_article_id_supplier` (`article_id`,`Supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='замены артикула';

/*Table structure for table `article_utility_numbers` */

DROP TABLE IF EXISTS `article_utility_numbers`;

CREATE TABLE `article_utility_numbers` (
  `article_id` int(11) unsigned DEFAULT NULL,
  `UtilityNo` text,
  `ShowImmediately` tinyint(1) DEFAULT NULL,
  KEY `IX_article_utility_numbers_article_id` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='применяемость артикула';

/*Table structure for table `articles` */

DROP TABLE IF EXISTS `articles`;

CREATE TABLE `articles` (
  `id` int(11) unsigned NOT NULL,
  `DataSupplierArticleNumber` varchar(255) DEFAULT NULL,
  `Supplier` int(11) unsigned DEFAULT NULL,
  `CurrentProduct` int(11) unsigned DEFAULT NULL,
  `NormalizedDescription` text,
  `HasLinkitems` tinyint(1) DEFAULT NULL,
  `HasPassengerCar` tinyint(1) DEFAULT NULL,
  `HasCommercialVehicle` tinyint(1) DEFAULT NULL,
  `HasMotorbike` tinyint(1) DEFAULT NULL,
  `HasEngine` tinyint(1) DEFAULT NULL,
  `HasAxle` tinyint(1) DEFAULT NULL,
  `HasCVManuID` tinyint(1) DEFAULT NULL,
  `LotSize1` int(11) unsigned DEFAULT NULL,
  `LotSize2` int(11) unsigned DEFAULT NULL,
  `FlagMaterialCertification` tinyint(1) DEFAULT NULL,
  `FlagSelfServicePacking` tinyint(1) DEFAULT NULL,
  `FlagRemanufactured` tinyint(1) DEFAULT NULL,
  `FlagAccessory` tinyint(1) DEFAULT NULL,
  `IsPseudoArticle` tinyint(1) DEFAULT NULL,
  `IsValid` tinyint(1) DEFAULT NULL,
  `Description` text,
  `ArticleStateAttributeGroup` varchar(255) DEFAULT NULL,
  `ArticleStateAttributeType` varchar(255) DEFAULT NULL,
  `ArticleStateDisplayTitle` varchar(255) DEFAULT NULL,
  `ArticleStateDisplayValue` varchar(255) DEFAULT NULL,
  `PackingUnit` int(11) unsigned DEFAULT NULL,
  `QuantityPerPackingUnit` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_article_supplier_article_number` (`Supplier`,`DataSupplierArticleNumber`),
  KEY `IX_DataSupplierArticleNumber_isvalid` (`DataSupplierArticleNumber`,`IsValid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='артикулы основная таблица';

/*Table structure for table `articles_linkages` */

DROP TABLE IF EXISTS `articles_linkages`;

CREATE TABLE `articles_linkages` (
  `item_type` tinyint(3) unsigned DEFAULT NULL,
  `item` int(11) unsigned DEFAULT NULL,
  `product` int(11) unsigned DEFAULT NULL,
  `supplier` int(11) unsigned DEFAULT NULL,
  `article` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `universal` tinyint(1) DEFAULT NULL,
  `linkages_attributes` text COLLATE utf8mb4_general_ci,
  KEY `IX_articles_linkages_item_type_item_product` (`item_type`,`item`,`product`),
  KEY `IX_articles_linkages_item_type_supplier` (`item_type`,`supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='связь артикулов, поставщиков, продуктов с машинами';

/*Table structure for table `axles` */

DROP TABLE IF EXISTS `axles`;

CREATE TABLE `axles` (
  `id` int(11) unsigned DEFAULT NULL,
  `Model` int(11) unsigned DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `CanBeDisplayed` tinyint(1) DEFAULT NULL,
  KEY `IX_axles_id_model` (`id`,`Model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='оси';

/*Table structure for table `commercialvehicles` */

DROP TABLE IF EXISTS `commercialvehicles`;

CREATE TABLE `commercialvehicles` (
  `id` int(11) unsigned DEFAULT NULL,
  `InternalID` int(11) unsigned DEFAULT NULL,
  `Model` int(11) unsigned DEFAULT NULL,
  `From` date DEFAULT NULL,
  `To` date DEFAULT NULL,
  `Description` text,
  `FullDescription` varchar(255) DEFAULT NULL,
  `CanBeDisplayed` tinyint(1) DEFAULT NULL,
  KEY `IX_commercialvehicles_id_internal_id_model` (`id`,`InternalID`,`Model`),
  KEY `IX_commercialvehicles_from_to` (`From`,`To`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='коммерческий транспорт';

/*Table structure for table `commercialvehicles_axles` */

DROP TABLE IF EXISTS `commercialvehicles_axles`;

CREATE TABLE `commercialvehicles_axles` (
  `vehicle_id` int(11) unsigned DEFAULT NULL,
  `axle_id` int(11) unsigned DEFAULT NULL,
  `AttributeGroup` varchar(255) DEFAULT NULL,
  `AttributeType` varchar(255) DEFAULT NULL,
  `DisplayTitle` varchar(255) DEFAULT NULL,
  `DisplayValue` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `FullDescription` varchar(255) DEFAULT NULL,
  KEY `IX_commercialvehicles_axles_vehicle_id_axle_id` (`vehicle_id`,`axle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='связь грузового транспорта с осями';

/*Table structure for table `commercialvehicles_link_cvm` */

DROP TABLE IF EXISTS `commercialvehicles_link_cvm`;

CREATE TABLE `commercialvehicles_link_cvm` (
  `vehicle_id` int(11) unsigned DEFAULT NULL,
  `manufacturer_id` int(11) unsigned DEFAULT NULL,
  KEY `IX_commercialvehicles_link_cvm_vehicle_id` (`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='связь коммерческого транспорта с производителями';

/*Table structure for table `commercialvehicles_link_engines` */

DROP TABLE IF EXISTS `commercialvehicles_link_engines`;

CREATE TABLE `commercialvehicles_link_engines` (
  `vehicle_id` int(11) unsigned DEFAULT NULL,
  `engine_id` int(11) unsigned DEFAULT NULL,
  KEY `IX_commercialvehicles_link_engines_vehicle_id` (`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='связь коммерческого транспорта с двигателями';

/*Table structure for table `countries` */

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `CountryCode` varchar(255) DEFAULT NULL,
  `CurrencyCode` varchar(255) DEFAULT NULL,
  `IsGroup` tinyint(1) DEFAULT NULL,
  `IsoCode2` varchar(255) DEFAULT NULL,
  `IsoCode3` varchar(255) DEFAULT NULL,
  `IsoCodeNo` int(11) DEFAULT NULL,
  `Description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='страны';

/*Table structure for table `engines` */

DROP TABLE IF EXISTS `engines`;

CREATE TABLE `engines` (
  `id` int(11) unsigned DEFAULT NULL,
  `InternalID` int(10) unsigned DEFAULT NULL,
  `manufacturer` int(11) unsigned DEFAULT NULL,
  `SalesDescription` text,
  `HasLinkitem` tinyint(1) DEFAULT NULL,
  `Description` text,
  `From` date DEFAULT NULL,
  `To` date DEFAULT NULL,
  `CanBeDisplayed` tinyint(1) DEFAULT NULL,
  KEY `IX_engines_id_manufacturer` (`id`,`manufacturer`),
  KEY `IX_engines_from_to_manufacturer` (`From`,`To`,`manufacturer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='двигатели';

/*Table structure for table `items_atributes` */

DROP TABLE IF EXISTS `items_atributes`;

CREATE TABLE `items_atributes` (
  `item_id` int(11) unsigned DEFAULT NULL,
  `AttributeGroup` varchar(255) DEFAULT NULL,
  `AttributeType` varchar(255) DEFAULT NULL,
  `DisplayTitle` varchar(255) DEFAULT NULL,
  `DisplayValue` varchar(255) DEFAULT NULL,
  `IsPassengerCar` tinyint(1) DEFAULT NULL,
  `IsCommercialVehicle` tinyint(1) DEFAULT NULL,
  `IsEngine` tinyint(1) DEFAULT NULL,
  `IsMotorbike` tinyint(1) DEFAULT NULL,
  `IsAxle` tinyint(1) DEFAULT NULL,
  `IsTransporter` tinyint(1) DEFAULT NULL,
  `IsCVManufacturerID` tinyint(1) DEFAULT NULL,
  `HasLink` tinyint(1) DEFAULT NULL,
  `IsValidForCurrentCountry` tinyint(1) DEFAULT NULL,
  `ParentLinkitem` int(11) unsigned DEFAULT NULL,
  `LinkitemType` varchar(255) DEFAULT NULL,
  `CanBeDisplayed` tinyint(1) DEFAULT NULL,
  KEY `IX_items_atributes_item_id_is` (`item_id`,`IsPassengerCar`,`IsCommercialVehicle`,`IsEngine`,`IsMotorbike`,`IsAxle`,`IsTransporter`,`IsCVManufacturerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='атрибуты любых сущьностей';

/*Table structure for table `manufacturers` */

DROP TABLE IF EXISTS `manufacturers`;

CREATE TABLE `manufacturers` (
  `id` int(11) unsigned DEFAULT NULL,
  `Matchcode` varchar(255) DEFAULT NULL,
  `IsVGL` tinyint(1) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `IsPassengerCar` tinyint(1) DEFAULT NULL,
  `IsCommercialVehicle` tinyint(1) DEFAULT NULL,
  `IsEngine` tinyint(1) DEFAULT NULL,
  `IsMotorbike` tinyint(1) DEFAULT NULL,
  `IsAxle` tinyint(1) DEFAULT NULL,
  `IsTransporter` tinyint(1) DEFAULT NULL,
  `IsCVManufacturerID` tinyint(1) DEFAULT NULL,
  `CanBeDisplayed` tinyint(1) DEFAULT NULL,
  KEY `IX_manufacturers_id_is` (`id`,`IsVGL`,`IsPassengerCar`,`IsCommercialVehicle`,`IsEngine`,`IsMotorbike`,`IsAxle`,`IsTransporter`,`IsCVManufacturerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='производители';

/*Table structure for table `models` */

DROP TABLE IF EXISTS `models`;

CREATE TABLE `models` (
  `id` int(11) unsigned DEFAULT NULL,
  `ManufacturerId` int(11) unsigned DEFAULT NULL,
  `From` date DEFAULT NULL,
  `To` date DEFAULT NULL,
  `Description` text,
  `CanBeDisplayed` tinyint(1) DEFAULT NULL,
  `IsPassengerCar` tinyint(1) DEFAULT NULL,
  `IsCommercialVehicle` tinyint(1) DEFAULT NULL,
  `IsEngine` tinyint(1) DEFAULT NULL,
  `IsMotorbike` tinyint(1) DEFAULT NULL,
  `IsAxle` tinyint(1) DEFAULT NULL,
  `IsTransporter` tinyint(1) DEFAULT NULL,
  `IsCVManufacturerID` tinyint(1) DEFAULT NULL,
  `HasLink` tinyint(1) DEFAULT NULL,
  `IsValidForCurrentCountry` tinyint(1) DEFAULT NULL,
  KEY `IX_models_id_manufacturer_id_is` (`id`,`ManufacturerId`,`IsPassengerCar`,`IsCommercialVehicle`,`IsEngine`,`IsMotorbike`,`IsAxle`,`IsTransporter`,`IsCVManufacturerID`),
  KEY `IX_models_from_to` (`From`,`To`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='модели п. автомобилей, ком. транспорта, мотоциклов';

/*Table structure for table `motorbikes` */

DROP TABLE IF EXISTS `motorbikes`;

CREATE TABLE `motorbikes` (
  `id` int(11) unsigned DEFAULT NULL,
  `InternalID` int(11) unsigned DEFAULT NULL,
  `Model` int(11) unsigned DEFAULT NULL,
  `ManufacturerMatchcode` varchar(255) DEFAULT NULL,
  `ManufacturerId` int(11) unsigned DEFAULT NULL,
  `From` date DEFAULT NULL,
  `To` date DEFAULT NULL,
  `Description` text,
  `FullDescription` varchar(255) DEFAULT NULL,
  `CanBeDisplayed` tinyint(1) DEFAULT NULL,
  KEY `IX_motorbikes_id_internal_id_model` (`id`,`InternalID`,`Model`),
  KEY `IX_motorbikes_model_from_to` (`Model`,`From`,`To`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='мотоциклы';

/*Table structure for table `passengercars` */

DROP TABLE IF EXISTS `passengercars`;

CREATE TABLE `passengercars` (
  `id` int(11) unsigned DEFAULT NULL,
  `InternalID` int(11) unsigned DEFAULT NULL,
  `Model` int(11) unsigned DEFAULT NULL,
  `ManufacturerMatchcode` varchar(255) DEFAULT NULL,
  `ManufacturerId` int(11) unsigned DEFAULT NULL,
  `From` date DEFAULT NULL,
  `To` date DEFAULT NULL,
  `Description` text,
  `FullDescription` varchar(255) DEFAULT NULL,
  `CanBeDisplayed` tinyint(1) DEFAULT NULL,
  KEY `IX_passengercars_model_manufacturer_id_from_to` (`Model`,`ManufacturerId`,`From`,`To`),
  KEY `IX_passengercars_InternalID` (`InternalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='пассажирские автомобили';

/*Table structure for table `passengercars_link_engines` */

DROP TABLE IF EXISTS `passengercars_link_engines`;

CREATE TABLE `passengercars_link_engines` (
  `car_id` int(11) unsigned DEFAULT NULL,
  `engine_id` int(11) unsigned DEFAULT NULL,
  KEY `IX_passengercars_link_engines_car_id` (`car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='связь пассажирских автомобилей с двигателями';

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `ID` int(11) unsigned NOT NULL,
  `internalID` int(11) unsigned DEFAULT NULL,
  `NormalizedDescription` varchar(255) DEFAULT NULL,
  `AssemblyGroupDescription` varchar(255) DEFAULT NULL,
  `UsageDescription` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  KEY `IX_products_id_internal_id` (`ID`,`internalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='продукты';

/*Table structure for table `search_trees` */

DROP TABLE IF EXISTS `search_trees`;

CREATE TABLE `search_trees` (
  `tree_id` tinyint(4) unsigned DEFAULT NULL,
  `node_id` int(11) unsigned DEFAULT NULL,
  `parent_node_id` int(11) unsigned DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  KEY `IX_search_trees_tree_id_node_id` (`tree_id`,`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='деревья продуктов';

/*Table structure for table `suppliers` */

DROP TABLE IF EXISTS `suppliers`;

CREATE TABLE `suppliers` (
  `DataVersion` int(11) unsigned DEFAULT NULL,
  `id` int(11) unsigned DEFAULT NULL,
  `internalID` int(11) unsigned DEFAULT NULL,
  `MatchCode` varchar(255) DEFAULT NULL,
  `NbrOfArticles` int(11) unsigned DEFAULT NULL,
  `HasNewVersionArticles` tinyint(1) DEFAULT NULL,
  `Description` text,
  KEY `IX_suppliers_id_internal_id` (`id`,`internalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='поставщики продуктов';

/*Table structure for table `suppliers_address` */

DROP TABLE IF EXISTS `suppliers_address`;

CREATE TABLE `suppliers_address` (
  `id` int(11) unsigned NOT NULL,
  `AddressTypeID` int(11) unsigned NOT NULL,
  `AddressType` varchar(255) DEFAULT NULL,
  `Name1` varchar(255) DEFAULT NULL,
  `Name2` varchar(255) DEFAULT NULL,
  `Street1` varchar(255) DEFAULT NULL,
  `Street2` varchar(255) DEFAULT NULL,
  `PostOfficeBox` varchar(255) DEFAULT NULL,
  `PostalCountryCode` varchar(255) DEFAULT NULL,
  `PostalCodeCity` varchar(255) DEFAULT NULL,
  `PostalCodePOB` varchar(255) DEFAULT NULL,
  `PostalCodeWholesaler` varchar(255) DEFAULT NULL,
  `City1` varchar(255) DEFAULT NULL,
  `City2` varchar(255) DEFAULT NULL,
  `Telephone` varchar(255) DEFAULT NULL,
  `Fax` varchar(255) DEFAULT NULL,
  `Homepage` varchar(255) DEFAULT NULL,
  `EMail` varchar(255) DEFAULT NULL,
  KEY `IX_suppliers_address_id_addresstypeid` (`id`,`AddressTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='адреса поставщиков продуктов';

/*Table structure for table `suppliers_link_address` */

DROP TABLE IF EXISTS `suppliers_link_address`;

CREATE TABLE `suppliers_link_address` (
  `supplier_id` int(11) unsigned DEFAULT NULL,
  `address_id` int(11) unsigned DEFAULT NULL,
  KEY `IX_suppliers_link_address_supplier_id` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='связь поставщиков с адресами';

/*Table structure for table `tree_node_products` */

DROP TABLE IF EXISTS `tree_node_products`;

CREATE TABLE `tree_node_products` (
  `itemId` int(11) unsigned DEFAULT NULL,
  `tree_id` tinyint(4) unsigned DEFAULT NULL,
  `parent_node_id` int(11) unsigned DEFAULT NULL,
  `node_id` int(11) unsigned DEFAULT NULL,
  `product_id` int(11) unsigned DEFAULT NULL,
  `valid_state` tinyint(3) unsigned DEFAULT NULL,
  KEY `IX_tree_node_products_item_id_valid_state` (`itemId`,`valid_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='соответствие продуктов узлам дерева категорий и модификациям автомобилей';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
