CREATE SEQUENCE country_seq;
CREATE TABLE IF NOT EXISTS country (
  id int NOT NULL DEFAULT NEXTVAL ('country_seq'),
  iso char(2) NOT NULL,
  name varchar(80) NOT NULL,
  nicename varchar(80) NOT NULL,
  iso3 char(3) DEFAULT NULL,
  numcode smallint DEFAULT NULL,
  phonecode int NOT NULL,
  region varchar(50),
  PRIMARY KEY (id)
)  ;



INSERT INTO country (id, iso, name, nicename, iso3, numcode, phonecode,region) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93,'Central Asia'),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355,'C&E. Europe'),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213,'ME & Africa'),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684,'S. America'),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376,'C&E. Europe'),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244,'ME & Africa'),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264,'W. Europe'),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', 'ATA', 10, 0,'Others'),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268,'S. America'),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54,'S. America'),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374,'C&E. Europe'),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297,'ME & Africa'),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61,'Asia'),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43,'W. Europe'),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994,'C&E. Europe'),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242,'S. America'),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973,'ME & Africa'),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880,'ASEAN'),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246,'S. America'),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375,'C&E. Europe'),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32,'W. Europe'),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501,'S. America'),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229,'ME & Africa'),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441,'W. Europe'),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975,'ASEAN'),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591,'S. America'),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387,'C&E. Europe'),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267,'ME & Africa'),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', 'BVT', 74, 0,'Others'),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55,'S. America'),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', 'IOT', 86, 246,'Others'),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673,'Asia'),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359,'C&E. Europe'),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226,'ME & Africa'),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257,'ME & Africa'),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855,'ASEAN'),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237,'ME & Africa'),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1,'N. America'),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238,'ME & Africa'),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345,'W. Europe'),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236,'ME & Africa'),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235,'ME & Africa'),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56,'S. America'),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86,'China'),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', 'CXR', 162, 61,'Others'),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672,'ME & Africa'),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57,'S. America'),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269,'ME & Africa'),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242,'ME & Africa'),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 243,'ME & Africa'),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682,'Oceania'),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506,'S. America'),
(53, 'CI', 'COTE D''IVOIRE', 'Cote D''Ivoire', 'CIV', 384, 225,'ME & Africa'),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385,'C&E. Europe'),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53,'S. America'),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357,'ME & Africa'),
(57, 'CZ', 'CZECHIA', 'Czech Republic', 'CZE', 203, 420,'C&E. Europe'),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45,'W. Europe'),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253,'ME & Africa'),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767,'S. America'),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1,'S. America'),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593,'S. America'),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20,'ME & Africa'),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503,'S. America'),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240,'ME & Africa'),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291,'ME & Africa'),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372,'C&E. Europe'),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251,'ME & Africa'),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500,'S. America'),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298,'W. Europe'),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679,'Oceania'),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358,'W. Europe'),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33,'W. Europe'),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594,'W. Europe'),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689,'W. Europe'),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', 'ATF', 260, 0,'W. Europe'),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241,'ME & Africa'),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220,'ME & Africa'),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995,'C&E. Europe'),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49,'W. Europe'),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233,'ME & Africa'),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350,'W. Europe'),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30,'W. Europe'),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299,'W. Europe'),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473,'S. America'),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590,'W. Europe'),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671,'N. America'),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502,'S. America'),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224,'ME & Africa'),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245,'ME & Africa'),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592,'S. America'),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509,'S. America'),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', 'HMD', 334, 0,'Others'),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39,'W. Europe'),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504,'S. America'),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852,'Asia'),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36,'C&E. Europe'),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354,'W. Europe'),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91,'India'),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62,'ASEAN'),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98,'ME & Africa'),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964,'ME & Africa'),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353,'W. Europe'),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972,'ME & Africa'),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39,'W. Europe'),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876,'S. America'),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81,'Japan'),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962,'ME & Africa'),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7,'Central Asia'),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254,'ME & Africa'),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686,'Oceania'),
(112, 'KP', 'NORTH KOREA', 'North Korea', 'PRK', 408, 850,'Asia'),
(113, 'KR', 'SOUTH KOREA', 'South Korea', 'KOR', 410, 82,'South Korea'),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965,'ME & Africa'),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996,'Central Asia'),
(116, 'LA', 'LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'Lao People''s Democratic Republic', 'LAO', 418, 856,'ASEAN'),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371,'C&E. Europe'),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961,'ME & Africa'),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266,'ME & Africa'),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231,'ME & Africa'),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218,'ME & Africa'),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423,'W. Europe'),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370,'C&E. Europe'),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352,'W. Europe'),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853,'Asia'),
(126, 'MK', 'NORTH MACEDONIA', 'North Macedonia', 'MKD', 807, 389,'C&E. Europe'),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261,'ME & Africa'),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265,'ME & Africa'),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60,'ASEAN'),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960,'Others'),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223,'ME & Africa'),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356,'C&E. Europe'),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692,'Oceania'),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596,'W. Europe'),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222,'ME & Africa'),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230,'ME & Africa'),
(137, 'YT', 'MAYOTTE', 'Mayotte', 'MYT', 175, 269,'W. Europe'),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52,'S. America'),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691,'Oceania'),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373,'C&E. Europe'),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377,'W. Europe'),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976,'Central Asia'),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664,'W. Europe'),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212,'ME & Africa'),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258,'ME & Africa'),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95,'ASEAN'),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264,'ME & Africa'),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674,'Oceania'),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977,'ASEAN'),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31,'W. Europe'),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599,'W. Europe'),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687,'W. Europe'),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64,'Asia'),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505,'S. America'),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227,'ME & Africa'),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234,'ME & Africa'),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683,'Oceania'),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672,'Asia'),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670,'N. America'),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47,'W. Europe'),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968,'ME & Africa'),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92,'Central Asia'),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680,'Oceania'),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970,'Asia'),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507,'S. America'),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675,'Oceania'),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595,'S. America'),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51,'S. America'),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63,'ASEAN'),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0,'W. Europe'),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48,'C&E. Europe'),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351,'W. Europe'),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787,'N. America'),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974,'ME & Africa'),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262,'W. Europe'),
(176, 'RO', 'ROMANIA', 'Romania', 'ROU', 642, 40,'C&E. Europe'),
(177, 'RU', 'RUSSIA', 'Russia', 'RUS', 643, 7,'C&E. Europe'),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250,'ME & Africa'),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290,'W. Europe'),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869,'S. America'),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758,'S. America'),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508,'W. Europe'),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784,'S. America'),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684,'Oceania'),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378,'W. Europe'),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239,'ME & Africa'),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966,'ME & Africa'),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221,'ME & Africa'),
(189, 'RS', 'SERBIA', 'Serbia', 'SRB', 688, 381,'C&E. Europe'),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248,'ME & Africa'),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232,'ME & Africa'),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65,'ASEAN'),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421,'C&E. Europe'),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386,'C&E. Europe'),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677,'Oceania'),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252,'ME & Africa'),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27,'ME & Africa'),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', 'SGS', 239, 0,'Oceania'),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34,'W. Europe'),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94,'ASEAN'),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249,'ME & Africa'),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597,'S. America'),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47,'W. Europe'),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268,'ME & Africa'),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46,'W. Europe'),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41,'W. Europe'),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963,'ME & Africa'),
(208, 'TW', 'TAIWAN', 'Taiwan', 'TWN', 158, 886,'Dev. Asia'),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992,'Central Asia'),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255,'ME & Africa'),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66,'ASEAN'),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', 'TLS', 626, 670,'ASEAN'),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228,'ME & Africa'),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690,'Oceania'),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676,'Oceania'),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868,'S. America'),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216,'ME & Africa'),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90,'ME & Africa'),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 993,'Central Asia'),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649,'W. Europe'),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688,'Oceania'),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256,'ME & Africa'),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380,'C&E. Europe'),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971,'ME & Africa'),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44,'W. Europe'),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1,'N. America'),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', 'UMI', 581, 1,'N. America'),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598,'S. America'),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998,'Central Asia'),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678,'Oceania'),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58,'S. America'),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84,'ASEAN'),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284,'W. Europe'),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340,'N. America'),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681,'Oceania'),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212,'ME & Africa'),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967,'ME & Africa'),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260,'ME & Africa'),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263,'ME & Africa'),
(240, 'ME', 'MONTENEGRO', 'Montenegro', 'MNE', 499, 382,'C&E. Europe'),
(241, 'XK', 'KOSOVO', 'Kosovo', 'XKX', 0, 383,'C&E. Europe'),
(242, 'AX', 'ALAND ISLANDS', 'Aland Islands', 'ALA', '248', '358','W. Europe'),
(243, 'BQ', 'BONAIRE, SINT EUSTATIUS AND SABA', 'Bonaire, Sint Eustatius and Saba', 'BES', '535', '599','W. Europe'),
(244, 'CW', 'CURACAO', 'Curacao', 'CUW', '531', '599','S. America'),
(245, 'GG', 'GUERNSEY', 'Guernsey', 'GGY', '831', '44','W. Europe'),
(246, 'IM', 'ISLE OF MAN', 'Isle of Man', 'IMN', '833', '44','W. Europe'),
(247, 'JE', 'JERSEY', 'Jersey', 'JEY', '832', '44','W. Europe'),
(248, 'BL', 'SAINT BARTHELEMY', 'Saint Barthelemy', 'BLM', '652', '590','W. Europe'),
(249, 'MF', 'SAINT MARTIN', 'Saint Martin', 'MAF', '663', '590','N. America'),
(250, 'SX', 'SINT MAARTEN', 'Sint Maarten', 'SXM', '534', '1','W. Europe'),
(251, 'SS', 'SOUTH SUDAN', 'South Sudan', 'SSD', '728', '211','ME & Africa');