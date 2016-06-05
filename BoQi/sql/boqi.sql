//用户表
create table bquserinfo(  --18
  usid int primary key,   --用户编号
  uname varchar2(20) default '匿名' not null unique,  --昵称
  registerpwd varchar2(20) not null,  --登录密码
  paypwd varchar2(6) not null,  --支付密码
  userpic varchar2(2000),  --头像 
  sex varchar2(2) not null check(sex in('男','女')),  --性别
  tel varchar2(20) not null,  --联系方式
  bqdou int ,   --波奇豆
  money number(8,2),  --现金余额
  birthday date,  --生日
  city varchar2(100),  --城市
  street varchar2(100),  --街道地址
  profession varchar2(20),  --职业
  qq int,   --QQ
  email varchar2(100) not null unique,  --邮箱
  hobbypet  varchar2(100),  --喜欢的宠物种类
  status int,  --状态
  test1 varchar2(200),      --预留字段
  test2 varchar2(200)   --预留字段
  )
  select seq_usid.nextval from dual
  select seq_usid.currval from dual
create sequence seq_usid  start with 1001 increment by 1;
insert into bquserinfo values(1001,'js','a','a',null,'男','122121121212',10,0,null,'美国','小巷','人',1212121212,'sdfasfsa@qq.com','狗狗',1,null,null);
insert into bquserinfo values(1003,'mi','a','a',null,'男','122121121212',10,0,null,'美国','小巷','人',1212121212,'sddsfffasfsa@qq.com','狗狗',1,null,null);
insert into bquserinfo values(1004,'kk','a','a',null,'男','122121121212',10,0,null,'美国','小巷','人',1212121212,'kk@qq.com','狗狗',1,null,null);
drop table bquserinfo;
select * from bquserinfo;

insert into userinfo values(seq_usid.nextval,'navy','a',123456,'adf','男',123456,0,0.0,'','','','',1336558111,'163@234335','中华田园犬',0,0,'');
select * from(select t.*,row_number() over (partition by t.tid order by t.proid desc) RN from productinfo t) where RN <=8
//这里的
select count(e.),p.proid from productinfo p,evaluates e where p.proname like '%狗%'
 group by p.proid with cube;
select count(*) from evaluates where proid=10001;
select * from productinfo p where p.proname like '%狗%'
intersect
select count(*) from evaluates where proid=10001;
commit;
select * from(select a.*,rownum rn from (select * from productinfo  where proname like '%狗%' order by proid) a where 
rownum<=5) b where rn>8;
 
	品牌信息表：	品牌编号	品牌名
create table brand(
       brandid int primary key,
       brandname varchar2(200),  --品牌名 
	   status int,               --状态
       test3 varchar2(200),      --预留字段
       test4 varchar2(200)      --预留字段
       )
create sequence seq_brandid start with 1001 increment by 1;
select distinct(brandname),count(*) from brand b,productinfo p where p.proname like '%狗%' and p.brandid=b.brandid group by brandname

drop table brand;
select * from brand;

insert into brand values(seq_brandid.nextval,'','','');
insert into brand values(seq_brandid.nextval,'深咖啡',1,'','');
insert into brand values(seq_brandid.nextval,'深咖啡',1,'','');


commit;


 商品一级分类表
create table firstmenu(
       fid int primary key not null, --分类编号
       fname varchar2(20) not null,   --分类名称
	   pet  varchar2(100),
	   status int,                     --状态
       test5 varchar2(200),      --预留字段
       test6 varchar2(200)   --预留字段
       )
create sequence seq_fid start with 1001 increment by 1;

drop table firstmenu;
select * from firstmenu;

insert into firstmenu values(seq_fid.nextval,'嘉良','狗',1,'','');

insert into firstmenu values(seq_fid.nextval,'狗粮','狗',1,'','');
insert into firstmenu values(seq_fid.nextval,'狗罐头妙鲜包','狗',1,'','');
insert into firstmenu values(seq_fid.nextval,'狗零食','狗',1,'','');

commit;
	

商品二级分类表
create table secondmenu(
       	tid int primary key,--分类编号
 	   	fid int
			constraint fs_fid references firstmenu(fid),
       	tname varchar2(20) not null,   --分类名称
		status int,                       --状态
      	test7 varchar2(200),      --预留字段
       	test8 varchar2(200)   --预留字段
       )
create sequence seq_tid start with 1001 increment by 1;

drop table secondmenu;
select * from secondmenu;

insert into secondmenu values(1,1024,'幼犬粮',1,'',''); 
insert into secondmenu values(2,1024,'成犬粮',1,'',''); 
insert into secondmenu values(3,1025,'成犬',1,'',''); 
insert into secondmenu values(4,1025,'幼犬',1,'',''); 
insert into secondmenu values(5,1026,'肉质零食',1,'',''); 
insert into secondmenu values(6,1026,'饼干素食',1,'',''); 


commit;
 

商品信息表：商品图片（放在字段中）      商品编号     商品图片连接      商品市场价      波奇价      商品名称      商品所属品牌      商品销量
      商品详情(介绍)      商品类型（狗粮，猫粮）      库存      标签
create table productinfo( 
  proid int primary key,   --商品编号
  proname varchar2(20) not null,  --商品名称
  nature varchar2(20),  --商品属性  比如多少码的裤子，大号小号的东西 
  brandid int
   	constraint pb_brandid references brand(brandid),  --商品所属品牌
  tid int
  	constraint pt_tid references secondmenu(tid),	--商品所属分类
  suitpet varchar2(200),     --适用什么宠物
  pictrue varchar2(4000) not null,    --商品图片
  promarprice number(7,2),   --商品市场价
  bqpri number(7,2) not null,   --波奇价
  prosales int not null,          --商品销量
  prointro varchar2(50) not null,   --商品详情
  inventory int not null,       --库存
  status int,                     --状态
  test9 varchar2(200),          --预留字段
  test10 varchar2(200)          --预留字段
  )
create sequence seq_proid start with 1001 increment by 1;

select o.orderid,o.proid,o.nature,o.pronum,o.bqpri,o.status,proname from orderform o,productinfo p where o.proid=p.proid and orderid=1001

drop table productinfo;
select * from productinfo;


select *from 


insert into productinfo values(seq_proid.nextval,'离乳期幼犬奶糕1kg','1Kg',1001,2,'狗狗','ji',100.0,80.0,20,'一款热卖的狗粮',234,1,'',''); 
insert into productinfo values(seq_proid.nextval,'泰迪贵成犬粮专用狗粮','100Kg',1001,2,'狗狗','j',102.0,79.0,20,'一款热卖的狗粮',234,1,'',''); 

insert into productinfo values(seq_proid.nextval,'美国狗粮','1Kg',1001,1,'狗狗','ji',100.0,80.0,20,'一款热卖的狗粮',234,1,'',''); 
insert into productinfo values(1,'超级狗粮','100Kg',1001,1,'狗狗','j',102.0,79.0,1000,'一款热卖的狗粮',234,1,'',''); 


select * from (select a.*,rownum rn from (select p.pictrue,p.proname,p.nature,p.bqpri,s.inventory,p.bqpri*s.inventory  from 
shopcar s,productinfo p where s.proid=p.proid and usid in(select usid from bquserinfo where uname='js')) a 
where rownum<5) b where rn>0


select * from (select t.*,row_number() over (partition by t.tid order by t.proid desc) RN from productinfo t) where RN <=8

select proid,proname,nature,b.brandname,s.tname,suitpet,pictrue,promarprice,bqpri,prosales,prointro,inventory,p.status from productinfo p,brand b,secondmenu s where p.brandid=b.brandid and p.tid=s.tid 


select proid,proname,nature,b.brandname,s.tname,suitpet,pictrue,promarprice,bqpri,prosales,prointro,inventory,p.status from productinfo p
left join brand b on p.brandid=b.brandid
left join secondmenu s on p.tid=s.tid where brandname like '%皇家%' or tname like '%成犬粮%'

insert into productinfo values(seq_proid.nextval,'狗狗2','1Kg',1001,1,'gougou','ji',100.0,80.0,20,'一款热卖的狗粮',234,1,'',''); 
insert into productinfo values(seq_proid.nextval,'狗狗','1Kg',1001,1,'gougou','ji',100.0,80.0,20,'一款热卖的狗粮',234,1,'',''); 
insert into productinfo values(seq_proid.nextval,'狗狗2','2Kg',1001,1,'gougou','ji',100.0,80.0,20,'一款热卖的狗粮',234,1,'',''); 
insert into productinfo values(seq_proid.nextval,'狗狗2','20Kg',1001,1,'gougou','ji',100.0,89.0,20,'一款热卖的狗粮',234,1,'',''); 

select nature from productinfo where proname='狗狗'

select * from(select a.*,rownum rn from (select proid,proname,nature,b.brandname,s.tname,suitpet,pictrue,promarprice,bqpri,prosales,prointro,inventory,p.status from productinfo p
left join brand b on p.brandid=b.brandid
left join secondmenu s on p.tid=s.tid order by proid) 
a where rownum<=10) b where rn>0

commit;
select proid,proname,nature from productinfo where proname='狗狗' union select proid,proname,nature from productinfo where proname='狗狗2' 

商品优惠表：
      时间段（双十一，国庆）      商品活动价      优惠编号            商品编号      商品促销信息
create table favorable(
  favorableid int primary key,  --优惠编号
  fstdate date not null,  --开始时间
  fendate date not null,  --结束时间
  actprice number(7,2) not null,  --商品活动价
  proid int
    constraint RF_proid references productinfo(proid),   --商品编号
  favinfo varchar2(2000), --商品促销信息
  status int,                --状态
  test11 varchar2(200),      --预留字段
  test12 varchar2(200)   --预留字段
  )
create sequence seq_favorableid start with 1001 increment by 1;

drop table favorable;
select * from favorable;

insert into favorable values(seq_favorableid.nextval,to_date('2015-1-1','yyyy-mm-dd'),to_date('2015-1-15','yyyy-mm-dd'),100,1004,'','yuliu','asdfa'); 

commit;

  
购物车：
            商品编号      用户编号      商品数量           //字段（整型的，存储所有的图片，判断图片是否在首页显示，判断图片的位置）
create table shopcar(
  proid int   --商品编号
    constraint Rs_proid references productinfo(proid),
  usid int   --用户编号
    constraint RF_usid references bquserinfo(usid),
  inventory int not null,   --商品数量
  test13 varchar2(200),      --预留字段
  test14 varchar2(200)   --预留字段
  )
drop table shopcar;
select * from shopcar;

DELETE FROM shopcar WHERE usid = 1001
insert into shopcar values(1001,1001,234,'','');    

commit;

收货地址表:
  收货人     邮编     电话     地址（是否默认）
create table address(
      addid int primary key, --地址编号
      usid int   --用户编号
        constraint Rs_usid references bquserinfo(usid),
      postcode int not null,     --邮编
      addname varchar2(50),  --收货人姓名
      tel varchar2(50) not null,          --电话
      shen varchar2(1000) not null,  --省
      shi varchar2(1000) not null,  --市
      xian varchar2(1000) not null,  --县
      zhenjie varchar2(1000),  --街道
      readdr varchar2(1000) not null,  --地址
      status int,  
      test15 varchar2(200),      --预留字段
      test16 varchar2(200)   --预留字段
       )

create sequence seq_add start with 9001 increment by 1;
       select * from address where usid=1001
drop table address;
select * from address;
update address set test15='李白' where usid=1001
  
insert into address values(seq_add.nextval,1001,424,'李白',132,'衡阳市',1,'','');
insert into address values(seq_add.nextval,1003,424,'小门',132,'zhongshi市',1,'','');

update address set addname='王小二',tel=132225,readdr='china' where addid=9001

insert into address values(1001,424,132,55,1,'','');
     
订单表：
      订单状态      订单号      商品编号      客户名称       客户编号      收货地址      商品数量(查找shopcar)
create table ordercontent(  
  orderid int primary key,--订单号,
  orderstate int,    --订单状态
  usid int    not null          --客户编号
    constraint fk_usid references bquserinfo(usid),
  addid int not null
    constraint as_addid references address(addid),       --收货地址
  starttime date,        --开始时间
  paytime date,        --付钱时间
  endtime date,        --完成时间
  ordersum number(8,2),       --一共付的钱
  test17 varchar2(200),      --预留字段
  test18 varchar2(200)   --预留字段
  )

    create sequence seq_orderid start with 1001 increment by 1;
select o.orderid,orderstate,usid,readdr,starttime,paytime,endtime,ordersum,proname from ordercontent o,productinfo p,orderform om where om.orderid=o.orderid and om.proid=p.proid and o.orderid=1001

update ordercontent set orderstate=2 where orderid=1004
drop table ordercontent;
select * from ordercontent;

update ordercontent set orderstate=2 where orderid=1004
update orderform set status=2 where orderid=1004

insert into ordercontent values(seq_orderid.nextval,2,1001,'dfsdfdf',to_date('2016-03-06 10:00:44','yyyy-MM-dd HH:mi:ss'),to_date('2016-03-06 10:00:44','yyyy-MM-dd HH:mi:ss'),null,1562,null,null)

select max(orderid) from ordercontent where usid=1001




insert into ordercontent values(1001,1,1001,'china',to_date('2015-1-1','yyyy-mm-dd'),null,null,623,'','');     
insert into ordercontent values(1004,1,1003,'china',to_date('2015-1-1','yyyy-mm-dd'),null,null,623,'','');     
insert into ordercontent values(105,1,1003,'china',to_date('2015-1-1','yyyy-mm-dd'),null,null,623,'','');     
insert into ordercontent values(10216,1,1003,'china',to_date('2015-1-1','yyyy-mm-dd'),null,null,623,'','');     
insert into ordercontent values(1027,1,1003,'china',to_date('2015-1-1','yyyy-mm-dd'),null,null,623,'','');     
insert into ordercontent values(1028,1,1003,'china',to_date('2015-1-1','yyyy-mm-dd'),null,null,623,'','');     
insert into ordercontent values(1029,1,1003,'china',to_date('2015-1-1','yyyy-mm-dd'),null,null,623,'','');     

select orderid,proid,nature,pronum,bqpri,status from orderform where orderid=1001
select distinct orderid,uname,starttime,orderstate,ordersum from ordercontent o,bquserinfo b where o.usid=b.usid and orderstate!=0 order by orderid
commit;

订单详情表
       订单编号        商品号      价格
create table orderform(
        orderid int  	--订单编号
               constraint FH_orderid references ordercontent(orderid),
        proid int 
              constraint FH_proid references productinfo(proid),   --商品编号
		pronum int,						--数量
        bqpri number(7,2) not null,   --波奇价
		status int,     --订单状态   0：取消交易       1：未支付   2：待发货    3:等待收货     4：交易完成    5：退货
        orrmid varchar2(200),      --预留字段
        test20 varchar2(200)   --预留字段
       )
drop table orderform;
select * from orderform;
insert into orderform values(1001,1100,1,10.2,1,orderform_add.nextval,'');   

select o.orderid,o.proid,o.nature,o.pronum,o.bqpri,o.status,proname,orrmid from orderform o,productinfo p where o.proid=p.proid and orderid=1001

update orderform set status=1 where orderid=1004


create sequence orderform_add start with 10001 increment by 1;

select proname,nature,p.bqpri,o.pronum,o.status from orderform o,productinfo p where o.proid=p.proid and p.status!=0

select * from (select a.*,rownum rn from (select distinct orderid,uname,starttime,orderstate,ordersum from ordercontent o,
				bquserinfo b where o.usid=b.usid and orderstate!=0 order by orderid) a where rownum<=10)b where rn>0	
insert into orderform values(1001,1100,1,10.2,1,orderform_add.nextval,'');   
insert into orderform values(1001,1101,8,10.2,1,orderform_add.nextval,''); 
insert into orderform values(1004,1102,8,10.2,1,orderform_add.nextval,''); 
insert into orderform values(1004,1104,1,17,1,orderform_add.nextval,'');   
insert into orderform values(1004,1102,1,90,1,orderform_add.nextval,''); 
insert into orderform values(10028,1063,1,10.2,1,'','');   
insert into orderform values(10028,1067,5,10.2,1,'','');   


insert into orderform values(1002,1021,'2Kg',1,10.2,1,'','');   
insert into orderform values(1002,1021,'2Kg',1,10.2,1,'','');   
insert into orderform values(1002,1022,'1Kg',5,10.2,1,'',''); 

select ji.orderid,ji.uname,ji.starttime,ji.orderstate,sum(bqpri*pronum) from 
(select distinct o.orderid,uname,starttime,orderstate,ordersum from ordercontent o,orderform ofm,bquserinfo b where o.usid=b.usid and o.orderid=ofm.orderid and orderstate!=0 order by o.orderid) ji,orderform orm 
where ji.orderid=orm.orderid group by ji.orderid,ji.uname,ji.starttime,ji.orderstate;




评价表：
      订单号      时间      买家秀图片      商品号      用户号      评价内容     时间      内容   评价状态
create table evaluates(
  orderid int 
 		constraint fk_orderid references ordercontent(orderid),  --订单号
  proid int not null unique
        constraint FK_proid references productinfo(proid),--商品号
  usid int not null unique
       constraint Ft_proid references bquserinfo(usid),--用户号
  evacontent varchar2(1000), --评价内容
  revacontent varchar2(1000), --回复评价内容
  edate date not null,   --时间
  buypic varchar2(4000),   --买家秀图片
  status int,     --评价状态
  test21 varchar2(200),      --预留字段
  test22 varchar2(200)   --预留字段
  )
create sequence seq_orderfoid start with 1001 increment by 1;

drop table evaluates;
select * from evaluates;
insert into evaluate values(seq_orderfoid.nextval,1001,1001,'',to_date('2015-1-1','yyyy-mm-dd'),'','已评价','','');  --插入失败

commit;

      

      
广告位：（分三级  宣传（3.内部），广告（2，合作商），主机（1.优先级最高））
      广告位编号
      群众（int 表按群众降序排列,实现信息的降序排序）
      时间段（双十一，国庆）
create table adver(
  adverid int primary key not null,  --广告位编号
  advpic varchar2(4000) not null,   --广告位图片 
  audience varchar2(20) not null,  --群众
  astdate date not null,  --开始时间
  aendate date not null,  --结束时间
  anumber int not null,  --点击次数
  test23 varchar2(200),      --预留字段
  test24 varchar2(200)   --预留字段
)
create sequence seq_adverid start with 1001 increment by 1;

drop table adver;
select * from adver;

insert into adver values(seq_adverid.nextval,'dfsdf.jpg','广告商',to_date('2015-5-1','yyyy-mm-dd'),to_date('2015-5-7','yyyy-mm-dd'),13242,'','');   

commit;
      
百科：宠物种类表：
        宠物种类
        
宠物信息表：       宠物名        宠物编号            宠物属性        英文名        祖籍        寿命        价格        性格特点 
                       简介        养护知识       喂食要点
create table pet(
  petid int primary key not null,--宠物编号
  petname varchar2(100) not null,  --宠物名  
  petpic varchar2(4000) not null,	
  pettype varchar2(100) not null, --宠物属性
  engname varchar2(100) not null, --英文名
  ancehome varchar2(100) ,    --祖籍
  life int not null,    --寿命
  petprice float not null,      --价格
  character varchar2(400),    --性格特点
  petintro varchar2(400),    --简介
  conserveinfo varchar2(2000),  --养护知识
  feedinfo varchar2(2000),   --喂食要点
  family varchar2(200),      --预留字段
  test26 varchar2(200)   --预留字段
  )
create sequence seq_petid start with 1001 increment by 1;
drop table pet;
select * from pet;
alter table scott.pet rename colnum test25 to family
ALTER TABLE SCOTT.PET RENAME COLUMN test25 TO family

select seq_petid from dual
select last_number from sequence where sequence_name='seq_petid';

update pet set family='狗' where petid=1002

insert into pet values(seq_petid.nextval,'哈士奇','宠物狗','hashiqi','',15,1000.0,'','','','','','');   --插入失败  
功能：多种商品列表，商品搜索，商品购买，

用户收藏表
create table collectpro(
	usid int
		constraint fs1_usid references bquserinfo(usid),
	proid int                 
    	constraint fe1_proid  references productinfo(proid),	
    test27 varchar2(200),
    test28 varchar2(200)	
)
drop table collectpro	


create table bqadmin(
	adid int,
	aname varchar2(20),
	pwd varchar2(20),
	weight int   --权限
)	
select * from bqadmin;
insert into bqadmin values(1001,'as','a',3);
create sequence seq_aid start with 1001 increment by 1;
	
	
	
	
	
