select distinct supplier from component_fact
order by supplier

Create table supplier (
    supplier_id         integer generated always as identity ,
    name            varchar(200),
    parent_company  varchar(200)
);

insert into supplier (name)
select distinct supplier from component_fact
order by supplier;

with parent as (
select distinct match,count(*) from (
    select supplier_id,name,unnest(regexp_match(name,'\w+\s')) as match
    from supplier
              ) s
group by match
having count(*)>1),
match as (
select name, "left"(match,length(match)-1) as match_name from supplier
cross join parent
where lower(name) ~* lower(parent.match) and "left"(lower(name),length(match)) = lower(match)
order by lower(match))

update supplier
set parent_company = match_name
from match
where supplier.name = match.name;


select * from supplier
where name ilike '%Tenneco%'




update supplier
set parent_company ='ADAC'
where name like 'ADAC Automotive%'
update supplier
set parent_company = 'AGS'
where name like 'AGS %'
update supplier
set parent_company = 'ATA Casting Technology'
where parent_company = 'ATA'
update supplier
set parent_company = null
where parent_company in ('AT','Changchun','Changsha','Chengdu','China','Chongqing','Foshan','Fuxin','GF','Guangdong','Hangzhou'
,'Harbin','Hebei','Hiroshima','Hubei','Hunan','Jiangsu','Jinzhou','Liuzhou','Lucas','Maxion','Metal','Thai','The','Tianjin'
,'Nanjing','New','Ningbo','Precision','SKH','Shandong','Shanghai','Shenyang','Siam','Sichuan','Taiwan','Wenzhou','Wuhan'
,'Wuhu','Wuxi','Yantai','Yuhuan','Zhejiang')
or name in ('American Axle & Manufacturing Holdings, Inc.','Art Metal Mfg. Co., LTD.','Asahi Tec Aluminium (Thailand) Co., Ltd.',
           'Asahi Tekko Co., Ltd.','Asama Giken Co., Ltd.')
or supplier_id in ('125','126','130','134','142','143','309','310','311')
update supplier
set parent_company = 'Daihatsu'
where name = 'Akashi-Kikai Industry Co., Ltd.'
update supplier
set parent_company = 'Akebono Brake Industry'
where name like 'Akebono%'
update supplier
set parent_company = 'Allison Transmission'
where parent_company ='Allison'
update supplier
set parent_company = 'American Mitsuba Corp.(AMC)'
where name like 'American Mitsuba%'
update supplier
set parent_company = 'Atsumitec'
where name like 'Atsumitec%'
update supplier
set parent_company = 'BAIC'
where name in ('Beijing Automotive (Huanghua) Parts Co., Ltd.','Beijing Hainachuan Automotive Parts Co., Ltd.')
update supplier
set parent_company = 'BASF Catalysts'
where parent_company  = 'BASF'
update supplier
set parent_company = 'BYD'
where name = 'BYD'
update supplier
set parent_company = 'Delphi'
where name ilike 'Beijing Delphi %'
update supplier
set parent_company = 'Hyundai'
where name ilike 'Beijing Hyundai %' or supplier_id = 1173
update supplier
set parent_company = 'Landi Renzo'
where name = 'Beijing Landi Renzo Autogas Systems Co., Ltd.'
update supplier
set parent_company = 'Sejong'
where name in ('Beijing Sejong Auto Parts Co., Ltd.','Chongqing Sejong Auto Parts Co., Ltd.')
or supplier_id in (1125,1230,1472)
update supplier
set parent_company = 'Trinova'
where name = 'Beijing Trinova Auto Tech Co., Ltd.'
update supplier
set parent_company = 'Beijing West Industries'
where name = 'Beijing West Industries Co., Ltd.' or name ilike 'BWI %'
update supplier
set parent_company = 'BEPC'
where name = 'Beiqi Beinei Engine Parts Co., Ltd.(BEPC)'
update supplier
set parent_company = 'Foton'
where name = 'Beiqi Foton' or supplier_id = '439'
update supplier
set parent_company = 'Benteler'
where name ilike 'Benteler %' or supplier_id = 1184
update supplier
set parent_company = 'BorgWarner'
where name ilike 'BorgWarner %'
update supplier
set parent_company = 'Bosch'
where name ilike 'Bosch %' or supplier_id = 1021 or parent_company = 'Robert'
update supplier
set parent_company = 'Benz'
where supplier_id in ('132','133')
update supplier
set parent_company = 'Mazda'
where name = 'Changan Mazda Engine Co., Ltd.' or supplier_id in (847,848)
update supplier
set parent_company = 'Suzuki'
where name = 'Changan Mazda Engine Co., Ltd.' or supplier_id in (1264)
update supplier
set parent_company = 'D-ACT'
where name like 'D-ACT%'
update supplier
set parent_company = 'Daihatsu'
where name = 'Daihatsu'
update supplier
set parent_company = 'FAW Group'
where parent_company = 'FAW' or supplier_id in ('374','375')
update supplier
set parent_company = 'Forvia'
where name = 'FORVIA SE (FORVIA faurecia) (Formerly Faurecia SE)'
update supplier
set parent_company = 'Farplas'
where supplier_id = '389'
update supplier
set parent_company = 'Federal-Mogul'
where name ilike 'Federal-Mogul %'
update supplier
set parent_company = 'Flex N Gate'
where supplier_id in ('432','433')
update supplier
set parent_company = 'Ford'
where supplier_id in ('435')
update supplier
set parent_company = 'Freudenberg Sealing Technologies'
where parent_company = 'Freudenberg' or supplier_id in ('445')
update supplier
set parent_company = 'G-TEKT'
where supplier_id in ('460','461')
update supplier
set parent_company = 'GAC Group'
where parent_company = 'GAC'
update supplier
set parent_company = 'Garrett Motion'
where parent_company = 'Garrett'
update supplier
set parent_company = 'Great Wall'
where supplier_id in ('494','495','496')
update supplier
set parent_company = 'Futaba'
where supplier_id in (503,221,1339,1032,1339)
update supplier
set parent_company = 'H-ONE'
where supplier_id in (510,511,512,513)
update supplier
set parent_company = 'SAIC Motor Group'
where supplier_id in (514,515,516,778,779,1115,1123,1175,1181) or parent_company = 'SAIC'
update supplier
set parent_company = 'HL Mando'
where parent_company = 'HL'
update supplier
set parent_company = 'Hanon Systems'
where parent_company = 'Hanon'
update supplier
set parent_company = 'Airui'
where supplier_id in (539,540)
update supplier
set parent_company = 'Dongan'
where supplier_id in (541,542,545)
update supplier
set parent_company = 'Ahresty'
where supplier_id in (27,501,548)
update supplier
set parent_company = 'Hitachi'
where supplier_id in (668,1080)
update supplier
set parent_company = 'Hoerbiger'
where supplier_id in (526,594)
update supplier
set parent_company = 'Hohsei'
where name = 'Hohsei Industrial Co., Ltd.'
update supplier
set parent_company = 'Honda'
where name = 'Honda'or supplier_id in (1010,1033)
update supplier
set parent_company = 'Hutchinson'
where supplier_id in (613)
update supplier
set parent_company = 'Daihatsu'
where supplier_id = 639
update supplier
set parent_company = 'Hino'
where supplier_id = 640
update supplier
set parent_company = 'Honda'
where supplier_id = 641
update supplier
set parent_company = 'Mazda'
where supplier_id = 642
update supplier
set parent_company = 'Mitsubishi'
where supplier_id in (643,1211)
update supplier
set parent_company = 'Nissan'
where supplier_id = 644
update supplier
set parent_company = 'Suzuki'
where supplier_id = 645
update supplier
set parent_company = 'Toyota'
where supplier_id in (646,1225,1354)
update supplier
set parent_company = 'Wonder Auto Technology Group (WATG)'
where supplier_id in (689,691)
update supplier
set parent_company = 'Johnson Electric'
where supplier_id = 692
update supplier
set parent_company = 'Johnson Matthey'
where supplier_id in (693,694,695)
update supplier
set parent_company = 'KB Autosys'
where parent_company = 'KB'
update supplier
set parent_company = 'Kaneta Kogyo'
where parent_company = 'Kaneta'
update supplier
set parent_company = 'Landai Technology Group'
where supplier_id = 767
update supplier
set parent_company = 'Liaoning SG Automotive'
where parent_company = 'Liaoning'
update supplier
set parent_company = 'CATARC'
where supplier_id in (777,1336)
update supplier
set parent_company = 'MacLean-Fogg'
where supplier_id in (814,815)
update supplier
set parent_company = 'Magneti Marelli'
where parent_company = 'Magneti'
update supplier
set parent_company = 'Mubea'
where supplier_id = 900
update supplier
set parent_company = 'Multimatic'
where supplier_id = 903
update supplier
set parent_company = 'Nemak'
where supplier_id = 945
update supplier
set parent_company = 'NBHX Group'
where supplier_id = 961
update supplier
set parent_company = 'Ningbo Shenglong Group'
where supplier_id in (963,964)
update supplier
set parent_company = 'Tuopu'
where supplier_id in (966,968)
update supplier
set parent_company = 'Ningbo Xusheng Group'
where supplier_id in (967)
update supplier
set parent_company = 'Mitsubishi'
where supplier_id in (971)
update supplier
set parent_company = 'Riken'
where supplier_id in (972,1015,1087)
update supplier
set parent_company = 'Sumitomo'
where supplier_id in (973)
update supplier
set parent_company = 'Nissan'
where supplier_id in (975)
update supplier
set parent_company = 'Aisan'
where supplier_id in (1006)
update supplier
set parent_company = 'Asama'
where supplier_id in (1007)
update supplier
set parent_company = 'Exedy'
where supplier_id = 1008
update supplier
set parent_company = 'FCC'
where supplier_id in (1009,242)
update supplier
set parent_company = 'Musashi'
where supplier_id in (1012)
update supplier
set parent_company = 'Otics'
where supplier_id in (1014,988,989,1001)
update supplier
set parent_company = 'Phinia'
where supplier_id = 1016
update supplier
set parent_company = 'PMG'
where supplier_id = 1017
update supplier
set parent_company = 'Posco'
where supplier_id = 1018
update supplier
set parent_company = 'Metalart'
where supplier_id in (1020,858)
update supplier
set parent_company = 'Aichi'
where supplier_id in (1023,1179)
update supplier
set parent_company = 'Aisin'
where supplier_id in (1024,1219,1220,1331,1334)
update supplier
set parent_company = 'Akebono'
where supplier_id in (1026)
update supplier
set parent_company = 'PCL'
where supplier_id in (1052)
update supplier
set parent_company = 'Pyung Hwa'
where supplier_id in (1064,1065)
update supplier
set parent_company = 'Sango'
where supplier_id in (1116,1117,1035,1458,508,1341)
update supplier
set parent_company = 'SHW'
where supplier_id in (1124,1164)
update supplier
set parent_company = 'SJG Sejung'
where supplier_id in (1126)
update supplier
set parent_company = 'SKF'
where supplier_id in (3)
update supplier
set parent_company = 'SNT Motiv'
where parent_company = 'SNT'
update supplier
set parent_company = 'Youfin'
where supplier_id in (257,1176,1444,1445)
update supplier
set parent_company = 'Zhenting Jinggong'
where supplier_id in (1177)
update supplier
set parent_company = 'SAGW'
where supplier_id in (1180)
update supplier
set parent_company = 'Shanghai Baolong'
where supplier_id in (1182)
update supplier
set parent_company = 'Shanghai Beite Tech'
where supplier_id in (1183)
update supplier
set parent_company = 'Shengrui'
where supplier_id in (1210)
update supplier
set parent_company = 'Lingyun'
where supplier_id in (1212)
update supplier
set parent_company = 'Denso'
where supplier_id in (1223,1030,1337,1338,1450,1337,1338)
update supplier
set parent_company = 'China South'
where supplier_id in (1228)
update supplier
set parent_company = 'Sika'
where supplier_id in (1232)
update supplier
set parent_company = 'Hino'
where supplier_id in (1241)
update supplier
set parent_company = 'SEGA'
where supplier_id in (1254,1255)
update supplier
set parent_company = 'Subaru'
where supplier_id in (1256,1257)
update supplier
set parent_company = 'Tenneco'
where supplier_id in (1318)
update supplier
set parent_company = 'Tesla'
where supplier_id in (1319)
update supplier
set parent_company = 'TEP'
where supplier_id in (1320)
update supplier
set parent_company = 'Thai Summit Group'
where supplier_id between 1324 and 1328
update supplier
set parent_company = 'Thai Summit Group'
where supplier_id between 1324 and 1328
update supplier
set parent_company = 'Trinova'
where supplier_id in (1343,145)
update supplier
set parent_company = 'Tokyo Roki'
where supplier_id in (1346,1347,1348)
update supplier
set parent_company = 'Tokyo Roki'
where supplier_id in (1346,1347,1348)
update supplier
set parent_company = 'Toyotetsu Otomotiv'
where supplier_id in (1364)
update supplier
set parent_company = 'UD Trucks'
where supplier_id in (1376,1377)
update supplier
set parent_company = 'Volkswagen'
where supplier_id in (1420)
update supplier
set parent_company = 'Volvo'
where supplier_id in (1425)
update supplier
set parent_company = 'Ruili'
where supplier_id in (1431,507)
update supplier
set parent_company = 'Y TEC'
where supplier_id in (1462,1463,1464)
update supplier
set parent_company = 'Asahi Tec'
where supplier_id in (90)


















