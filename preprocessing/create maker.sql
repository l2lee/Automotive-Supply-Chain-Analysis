Create table maker (
    supplier_id         integer generated always as identity ,
    name            varchar(200),
    year            integer,
    maker_group  varchar(200)
);



insert into maker (name,year)
select distinct maker, model_year from component_fact
order by maker, model_year;

select * from  maker
         where maker_group is null
             order by name
where name ilike '%shanghai%'
           ('', 'Geometry', '', 'Geely/', ' Automotive',
               'Geely Galaxy', '', '', 'Geely/Englon/Emgrand', '',
               '', '', 'LEVC', '', 'Polestar', '', 'Geely/Emgrand',
               'Geely Sichuan Commercial Vehicle', '', 'Jiangxi Geely New Energy Commercial Vehicles');



update maker
set maker_group = 'Toyota Group'
where name in ('Toyota','Daihatsu','Hino')
update maker
set maker_group = 'VW Group'
where name in ('JETTA', 'Skoda', 'Bentley', 'Skoda/VW', 'MAN', 'Neoplan',
               'VW', 'SEAT', 'Lamborghini', 'Scania', 'MAN/Scania', 'ERF',
               'Audi', 'Porsche', 'Bugatti', 'Scania', 'International',' TRATON')
UPDATE maker
SET maker_group = 'Hyundai Kia Automotive Group'
WHERE name IN ('Hyundai', 'Beijing Hyundai', 'Hyundai Truck & Bus (China) Co., Ltd.',
               'Kia', 'Dongfeng Yueda Kia', 'Genesis', 'Horki', 'Shouwang');
UPDATE maker
SET maker_group = 'Stellantis'
WHERE name IN ('Fiat', 'Ram Trucks', 'Lancia', 'Citroen','Jeep', 'Chrysler', 'Maserati', 'Opel',
'Dodge', 'Alfa Romeo', 'Peugeot', 'DS') and year >=2021;
UPDATE maker
SET maker_group = 'GM Group'
WHERE name IN ('Chevrolet', 'GM Daewoo', 'Vauxhall', 'Alpheon', 'SAIC GM Wuling',
               'Shanghai GM Wuling', 'Cadillac', 'Uz-Daewoo', 'Daewoo', 'GM Holden') or (name = 'Opel' and year <=2017) or (name = 'Saab' and year <=2009);
UPDATE maker
SET maker_group = 'Ford Group'
WHERE name IN ('Ford') or (name = 'Volvo Cars' AND year <= 2010)
UPDATE maker
SET maker_group = 'Honda'
WHERE name IN ('Honda', 'CIIMO', 'Acura', 'Everus');
UPDATE maker
SET maker_group = 'Nissan'
WHERE name IN ('Nissan', 'Datsun', 'Infiniti', 'Venucia');
UPDATE maker
SET maker_group = 'Suzuki'
WHERE name ilike '%Suzuki%';
UPDATE maker
SET maker_group = 'BYD Auto'
WHERE name IN ('BYD', 'Changsha BYD Bus', 'Guangzhou GAC BYD New Energy Bus',
               'Yangwang', 'FangChengBao') or (name = 'DENZA New Energy' and year >=2022);
UPDATE maker
SET maker_group = 'Geely Holding Group'
WHERE name IN ('Geely', 'LEVC','Polestar','Livan Auto') or (name = 'Volvo Cars' and year >=2011)
or (name = 'Lotus' AND year >= 2017);
UPDATE maker
SET maker_group = 'FCA'
WHERE name in ('Fiat','Ram Trucks') AND year <= 2020;
UPDATE maker
SET maker_group = 'FCA'
WHERE name = 'Ferrari' AND year <= 2020;
UPDATE maker
SET maker_group = 'FCA'
WHERE name = 'Jeep' AND year BETWEEN 2009 AND 2020;
UPDATE maker
SET maker_group = 'FCA'
WHERE name = 'Chrysler' AND year BETWEEN 2009 AND 2020;
UPDATE maker
SET maker_group = 'FCA'
WHERE name = 'Lancia' AND year <= 2020;
UPDATE maker
SET maker_group = 'FCA'
WHERE name = 'Dodge' AND year BETWEEN 2009 AND 2020;
UPDATE maker
SET maker_group = 'FCA'
WHERE name = 'Alfa Romeo' AND year <= 2020;
UPDATE maker
SET maker_group = 'FCA'
WHERE name = 'Maserati' AND year <= 2020;
UPDATE maker SET maker_group = 'PSA' WHERE name = 'Peugeot' AND year <= 2020;
UPDATE maker SET maker_group = 'PSA' WHERE name = 'Citroen' AND year <= 2020;
UPDATE maker SET maker_group = 'PSA' WHERE name = 'Opel' AND year BETWEEN 2018 AND 2020;
UPDATE maker SET maker_group = 'PSA' WHERE name = 'DS Automobiles' AND year <= 2020;
UPDATE maker SET maker_group = 'Mercedes-Benz Group' WHERE name = 'Mercedes-Benz' AND year >= 2022;
UPDATE maker SET maker_group = 'Mercedes-Benz Group' WHERE name = 'smart' AND year >= 2022;
UPDATE maker SET maker_group = 'Daimler Group' WHERE name = 'Mercedes-Benz' AND year <= 2021;
UPDATE maker SET maker_group = 'Daimler Group' WHERE name = 'Freightliner';
UPDATE maker SET maker_group = 'Daimler Group' WHERE name = 'Mitsubishi Fuso';
UPDATE maker SET maker_group = 'Daimler Group' WHERE name = 'Evobus' AND year <= 2021;
UPDATE maker SET maker_group = 'Daimler Group' WHERE name = 'smart' AND year <= 2021;
UPDATE maker SET maker_group = 'Daimler Group' WHERE name = 'DENZA New Energy' AND year <= 2021;
UPDATE maker SET maker_group = 'Daimler Group' WHERE name in ('Daimler','Daimler Truck');
UPDATE maker SET maker_group = 'BMW'
             WHERE name in ('BMW','Rolls-Royce');
UPDATE maker SET maker_group = 'Renault'
             WHERE name in ('Renault','Renault Korea','Renault Samsung');
UPDATE maker SET maker_group = 'Brilliance Automobile Group'
             WHERE name in ('BMW Brilliance','Renault Brilliance JINBEI');
UPDATE maker SET maker_group = 'Dongfeng'
             WHERE name in ('Dongfeng Renault');
UPDATE maker SET maker_group = 'Tesla'
             WHERE name in ('Tesla','Tesla China');
UPDATE maker SET maker_group = 'Mazda'
             WHERE name in ('Mazda','Changan Mazda');
UPDATE maker SET maker_group = 'Mitsubishi'
             WHERE name in ('Mitsubishi','GAC Mitsubishi');
UPDATE maker SET maker_group = 'Subaru'
             WHERE name in ('Subaru');
UPDATE maker SET maker_group = 'Tata Group' WHERE name = 'Tata';
UPDATE maker SET maker_group = 'Tata Group'
             WHERE name in ('Jaguar Land Rover') AND year >= 2008;
UPDATE maker SET maker_group = 'Chery Automobile' WHERE name ilike '%Chery%';
UPDATE maker SET maker_group = 'Mahindra & Mahindra'
             WHERE name in ('Mahindra & Mahindra','KG Mobility','SsangYong');
UPDATE maker SET maker_group = 'FAW (China FAW Group Corp.)'
             WHERE name in ('FAW','FAW Bestune','FAW Car','FAW Haima','FAW Jilin','Haima',
                           'FAW Toyota','FAW-Volkswagen','Tianjin FAW Xiali','SITECH');
UPDATE maker SET maker_group = 'Isuzu' WHERE name = 'Isuzu';
UPDATE maker SET maker_group = 'Isuzu' WHERE name = 'UD Trucks' AND year >= 2021;
UPDATE maker SET maker_group = 'Lifan Technology (Group)' WHERE name = 'Lifan';
UPDATE maker SET maker_group = 'Volvo Trucks Group' WHERE name = 'Volvo Trucks';
UPDATE maker SET maker_group = 'Volvo Trucks Group' WHERE name = 'Mack Trucks';
UPDATE maker SET maker_group = 'Volvo Trucks Group' WHERE name = 'Renault Trucks';
UPDATE maker SET maker_group = 'Volvo Trucks Group' WHERE name = 'UD Trucks' AND year >= 2008;
UPDATE maker SET maker_group = 'Paccar' WHERE name = 'Peterbilt';
UPDATE maker SET maker_group = 'Proton' WHERE name = 'Proton';
UPDATE maker SET maker_group = 'Proton' WHERE name = 'Lotus' AND year <= 2016;
UPDATE maker SET maker_group = 'CNH Industrial' WHERE name = 'Iveco';
UPDATE maker SET maker_group = 'GAZ Group' WHERE name = 'GAZ';
UPDATE maker SET maker_group = 'VDL Group' WHERE name = 'VDL Bus & Coach';
UPDATE maker SET maker_group = 'KAMAZ Group' WHERE name = 'KAMAZ';
UPDATE maker SET maker_group = 'Ferrari' WHERE name = 'Ferrari' and year >=2021;
UPDATE maker SET maker_group = 'Aston Martin' WHERE name = 'Aston Martin';
UPDATE maker SET maker_group = 'BAIC Group'
             WHERE name in ('Beijing Automobile Works','Beijing Benz','Beijing Borgward'
                           'BAIC Foton','Beiqi Foton','Changhe') or name ilike 'BAIC%';
UPDATE maker SET maker_group = 'Brilliance Automobile Group' WHERE name ilike '%Brilliance%';
UPDATE maker SET maker_group = 'Changan Automobile Group'
             WHERE name in ('Changan','Deepal','Hafei');
UPDATE maker SET maker_group = 'Jiangling Motors Co. Group'
             WHERE name ilike '%Jiangling%';
UPDATE maker SET maker_group = 'Dongfeng'
             WHERE name in ('Dongfeng','Dongfeng Honda','Dongfeng Yulon','Dongfeng Peugeot Citroen',
                           'Dongfeng Passenger Vehicle','Dongfeng Nissan','Dongfeng Liuzhou Motor',
                           'VOYAH Motor','DFSK','Zhengzhou Nissan');
UPDATE maker SET maker_group = 'Eicher Motors' WHERE name = 'Eicher';
UPDATE maker SET maker_group = 'FJMG'
             WHERE name in ('Fujian Benz','Soueast','Yudo New Energy');
UPDATE maker SET maker_group = 'GAC Group'
             WHERE name in ('GAC Aion','GAC Changfeng','GAC Fiat Chrysler','GAC Gonow',
                           'GAC Honda','GAC Motor','GAC Toyota');
UPDATE maker SET maker_group = 'Hawtai Automobile Group' WHERE name = 'Hawtai';
UPDATE maker SET maker_group = 'SAIC Group'
             WHERE name in ('SAIC GM','SAIC Maxus','SAIC Passenger Vehicle','SAIC Volkswagen',
                           'Rising Auto','Shanghai GM','Shanghai Volkswagen');
UPDATE maker SET maker_group = 'Hawtai Automobile Group' WHERE name = 'Hawtai';
UPDATE maker SET maker_group = 'BAIC Group' where name in ('ARCFOX','Beijing Borgward')
UPDATE maker SET maker_group = 'AvtoVAZ' where name = 'AvtoVAZ'
UPDATE maker SET maker_group = 'Changan Automobile Group'
where name in ('Changan EV','Changan Ford','Changan Kuayue','Changan PSA','Changan Volvo')
UPDATE maker SET maker_group = 'Stellantis'
where name in ('DS Automobiles')
UPDATE maker SET maker_group = 'Renault' where name = 'Dacia'
UPDATE maker
SET maker_group = 'FCA'
WHERE name = 'Dodge' AND year BETWEEN 2008 AND 2020;
UPDATE maker SET maker_group = 'GWM' WHERE name = 'Great Wall';
UPDATE maker SET maker_group = 'SAIC Group' WHERE name = 'IM Motors';
UPDATE maker SET maker_group = 'JAC Group' WHERE name in ('JAC Group','JAC');
UPDATE maker SET maker_group = 'Jiangling Motors Co. Group'
             where name in ('JMEV','Jiangxi Isuzu');
UPDATE maker
SET maker_group = 'FCA'
WHERE name = 'Jeep' AND year BETWEEN 2008 AND 2020;
UPDATE maker SET maker_group = 'Leap Motor' WHERE name = 'Leap';
UPDATE maker SET maker_group = 'Li Auto' WHERE name = 'Li Auto';
UPDATE maker SET maker_group = 'Hozon Auto' WHERE name = 'NETA';
UPDATE maker SET maker_group = 'NIO' WHERE name = 'NIO';
UPDATE maker SET maker_group = 'Perodua' WHERE name = 'Perodua';
UPDATE maker SET maker_group = 'Seres Group'
             WHERE name in ('SERES','Ruichi');
UPDATE maker SET maker_group = 'Zotye Holding Group'
             WHERE name in ('Traum','Zotye');
UPDATE maker SET maker_group = 'Sollers Group' WHERE name = 'UAZ';
UPDATE maker SET maker_group = 'Geely Holding Group' where name = 'Volvo Cars Asia Pacific';
UPDATE maker SET maker_group = 'Xpeng' where name = 'Xpeng';
UPDATE maker SET maker_group = 'Yulon Group' where name = 'Yulon';
update maker set maker_group = 'Small and Medium OEM' where maker_group is null