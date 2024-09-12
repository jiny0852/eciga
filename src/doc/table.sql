
#######################################################
################# eciga_db 계정 ####################


drop user 'eciga'@'%';

create user 'eciga'@'%' identified by 'eciga';

grant all privileges on eciga_db.* to 'eciga'@'%';

flush privileges;


#######################################################
################# eciga_db DB생성 ##################


drop database eciga_db;

create database eciga_db
	default character set utf8mb4
    collate utf8mb4_general_ci
    default encryption='n'
;

show databases;

use eciga_db;










CREATE TABLE `users` (
	`uNo`	integer 		  primary key     auto_increment,
	`uid`	varchar(20)	,
	`name`	varchar(20)	,
	`password`	varchar(20)	,
	`hp`	varchar(20)	,
	`address`	varchar(200),
	`birth`	varchar(10),
    `ssn`	int,
	`role`	int,
    `status`	int
);

CREATE TABLE `goods` (
	`gNo`	integer 		  primary key     auto_increment,
	`name`	varchar(50)	,
	`price`	int	,
	`descript`	varchar(1000)	,
	`imgSize`	int	,
	`imgPath`	varchar(1000)	,
	`imgName`	varchar(1000)	
);

CREATE TABLE `board` (
	`bNo`	integer 		  primary key     auto_increment,
	`uid`	int	NOT NULL,
	`title`	varchar(100),
	`content`	varchar(3000)	,
	`regDate`	date	,
	`ansStatus`	int	,
	`answer`	varchar(500)	,
	`date`	date	
);



CREATE TABLE delivery (
    order_no INT PRIMARY KEY AUTO_INCREMENT,  -- 주문번호
    payment_amount INT,                       -- 결제금액
    payment_status INT,                       -- 결제여부 (0:완료, 1:미결제, 2:취소)
    payment_method INT,                       -- 결제수단 (0:카드, 1:계좌이체, 2:무통장입금, 3:간편결제)
    purchase_confirm_date DATE,               -- 구매확정날짜
    user_id INT,                              -- 주문회원 (users 테이블과 JOIN)
    delivery_status INT,                      -- 배송상태 (0:준비중, 1:배송중, 2:배송완료, 3:확인요망)
    FOREIGN KEY (user_id) REFERENCES users(uNo)  -- Join with users
);





CREATE TABLE `cart` (
	`cNo`	integer 		  primary key     auto_increment,
	`uNo`	int	,
	`fNo`	int	,
	`count`	int	
);


CREATE TABLE `color` (
	`cno`	integer 		  primary key     auto_increment,
	`color`	varchar(20)	
);

CREATE TABLE `listGoods` (
	`fNo`	integer 		  primary key     auto_increment,
	`gNo`	int	,
	`color`	int		
);


CREATE TABLE `selectedGoods` (
	`sno`	integer 		  primary key     auto_increment,
	`pNo`	int	,
	`fNo`	int	,
	`Field`	int	,
	`total`	int	
);

CREATE TABLE customer_ask (
    inquiry_no INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    user_id INT,
    reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT '답변대기',
    answer_date TIMESTAMP NULL,
    content TEXT,
    answer TEXT
);


ALTER TABLE `board` ADD CONSTRAINT `FK_user_TO_board_1` FOREIGN KEY (	`uid`)REFERENCES `users` (	`uNo`);

ALTER TABLE `cart` ADD CONSTRAINT `FK_user_TO_cart_1` FOREIGN KEY (	`uno`)REFERENCES `users` (	`uno`);

ALTER TABLE `cart` ADD CONSTRAINT `FK_listGoods_TO_cart_1` FOREIGN KEY (	`fNo`)REFERENCES `listGoods` (	`fNo`);

ALTER TABLE `listGoods` ADD CONSTRAINT `FK_goods_TO_listGoods_1` FOREIGN KEY (	`gNo`)REFERENCES `goods` (	`gNo`);

ALTER TABLE `listGoods` ADD CONSTRAINT `FK_options_TO_listGoods_1` FOREIGN KEY (	`color`)REFERENCES `color` (	`cno`);

ALTER TABLE `selectedGoods` ADD CONSTRAINT `FK_delivery_TO_selectedGoods_3` FOREIGN KEY (	`pNo`)REFERENCES `delivery` (	`order_no`);

ALTER TABLE `selectedGoods` ADD CONSTRAINT `FK_listGoods_TO_selectedGoods_1` FOREIGN KEY (	`fNo`)REFERENCES `listGoods` (	`fNo`);

ALTER TABLE customer_ask ADD CONSTRAINT `FK_user_TO_customer_ask_1` FOREIGN KEY (	`user_id`)REFERENCES `users` (	`uNo`);










