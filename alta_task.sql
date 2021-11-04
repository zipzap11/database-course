create database alta_online_shop;
use alta_online_shop;
-- Creating table
create table user (
    id int primary key auto_increment,
    address text,
    dob datetime,
    marital varchar(255),
    gender varchar(12),
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp);
create table products (
    id int primary key auto_increment,
    name varchar(255),
    stock int,
    thumbnail_url varchar(255),
    price int,
    product_type_id int,
    operator_id int,
    status tinyint,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp);
create table product_type (
    id int primary key auto_increment,
    name varchar(255),
    status tinyint,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp);
create table product_description (
    id int primary key auto_increment,
    product_id int,
    description text,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);
create table operator (
    id int primary key auto_increment,
    name varchar(255),
    status tinyint,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp);
create table transaction (
    id int primary key auto_increment,
    user_id int,
    total int,
    payment_method_id int,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp);
create table payment_method (
    id int primary key auto_increment,
    name varchar(255),
    status tinyint,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp);
create table transaction_detail (
    transaction_id int,
    product_id int,
    qty int,
    price int,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp);
alter table products ADD CONSTRAINT product_type_id FOREIGN KEY (product_type_id) REFERENCES product_type(id);
alter table product_description add constraint product_id foreign key (product_id) references products(id);
-- Insert 5 operators pada table operators.
insert into operator (name, status) values
    ('Telkomsel', 1),
    ('Smartfren', 1),
    ('By.U', 1),
    ('XL', 1),
    ('Indosat', 1);
-- Insert 3 product type.   
insert into product_type (name, status) values
    ('Pulsa', 1),
    ('Kuota', 1),
    ('Telepon', 1);
-- Insert 2 product dengan product type id = 1, dan operators id = 3.
-- Insert 3 product dengan product type id = 2, dan operators id = 1.
-- Insert 3 product dengan product type id = 3, dan operators id = 4.
insert into products (name, stock, thumbnail_url, price, product_type_id, operator_id, status) values
    ('Pulsa 10000', 10, 'google.com/12jqiwoe', 12000, 1, 3, 1),
    ('Pulsa 20000', 10, 'google.com/12jqiwoe', 22000, 1, 3, 1),
    ('kuota 10 GB', 10, 'google.com/12jqiwoe', 50000, 2, 1, 1),
    ('kuota 5 GB', 10, 'google.com/12jqiwoe', 30000, 2, 1, 1),
    ('kuota unlimited', 10, 'google.com/12jqiwoe', 20000, 2, 1, 1),
    ('Telepon 300 menit', 10, 'google.com/12jqiwoe', 13000, 3, 4, 1),
    ('Telepon 10 jam', 10, 'google.com/12jqiwoe', 25000, 3, 4, 1),
    ('Telepon 2 jam', 10, 'google.com/12jqiwoe', 15000, 3, 4, 1);
-- Insert product description pada setiap product.
insert into product_description (product_id, description) values
    (1, 'Pulsa sebesar 10.000 ribu dengan harga Rp. 12.000'),
    (2, 'Pulsa sebesar 20.000 dengan harga Rp. 12.000'),
    (3, 'Kuota sebanyak 10 gigabyte dengan harga Rp. 50.000'),
    (4, 'Kuota sebanyak 5 gigabyte dengan harga Rp. 30.000'),
    (5, 'Kuota unlimited dengan harga Rp. 20.000'),
    (6, 'Akses telepon selama 300 menit dengan harga Rp. 13.000'),
    (7, 'Akses telepon selama 10 jam dengan harga Rp. 25.000'),
    (8, 'Akses telepon selama 2 jam dengan harga Rp. 15.000');
-- Insert 3 payment methods.
insert into payment_method (name, status) values
    ('Transfer BCA', 1),
    ('OVO', 1),
    ('Gopay', 1);
-- Insert 5 user pada tabel user.
insert into user (address, dob, marital, gender) values
    ('Bogor', '2000-09-11', 'no', 'M'),
    ('Depok', '2001-10-12', 'no', 'F'),
    ('Jakarta', '2002-11-13', 'no', 'F'),
    ('Bandung', '2003-10-10', 'no', 'M'),
    ('Bekasi', '1998-19-20', 'yes', 'M');
-- Insert 3 transaksi di masing-masing user. (soal berlanjut ke soal 1.j)
insert into transaction (user_id, total, payment_method_id) values
(1, 84000, 1), 
(1, 102000, 2),
(1, 100000, 1),
(2, 63000, 3),
(2, 58000, 3),
(2, 53000, 1),
(3, 52000, 1),
(3, 49000, 1),
(3, 84000, 1),
(4, 102000, 2),
(4, 100000, 1),
(4, 63000, 1),
(5, 58000, 2),
(5, 53000, 3),
(5, 52000, 3);
-- Insert 3 product di masing-masing transaksi.
insert into transaction_detail (transaction_id, product_id, qty, price) values
(1, 1, 1, 12000),
(1, 2, 1, 22000),
(1, 3, 1, 50000),
(2, 2, 1, 22000),
(2, 3, 1, 50000),
(2, 4, 1, 30000),
(3, 3, 1, 50000),
(3, 4, 1, 30000),
(3, 5, 1, 20000),
(4, 4, 1, 30000),
(4, 5, 1, 20000),
(4, 6, 1, 13000),
(5, 5, 1, 20000),
(5, 6, 1, 13000),
(5, 7, 1, 25000),
(6, 6, 1, 13000),
(6, 7, 1, 25000),
(6, 8, 1, 15000),
(7, 7, 1, 25000),
(7, 8, 1, 15000),
(7, 1, 1, 12000),
(8, 8, 1, 15000),
(8, 1, 1, 12000),
(8, 2, 1, 22000),
(9, 1, 1, 12000),
(9, 2, 1, 22000),
(9, 3, 1, 50000),
(10, 2, 1, 22000),
(10, 3, 1, 50000),
(10, 4, 1, 30000),
(11, 3, 1, 50000),
(11, 4, 1, 30000),
(11, 5, 1, 20000),
(12, 4, 1, 30000),
(12, 5, 1, 20000),
(12, 6, 1, 13000),
(13, 5, 1, 20000),
(13, 6, 1, 13000),
(13, 7, 1, 25000),
(14, 6, 1, 13000),
(14, 7, 1, 25000),
(14, 8, 1, 15000),
(15, 7, 1, 25000),
(15, 8, 1, 15000),
(15, 1, 1, 12000);

-- 2.SELECT
select * from user where gender='M';
select * from products where id=3;
alter table user add column nama varchar(255);
select * from user where nama like '%a%' and created_at between '2021-09-29 00:00:00' and '2021-10-3 00:00:00';
select count(gender) from user where gender='F';
select * from user order by nama asc;
select * from products limit 5;

-- 3.UPDATE
update products set name='product-dummy' where id=1;
update transaction_detail set qty=3 where product_id=1;

-- 4.DELETE
delete from products where id=1;
delete from products where product_type_id=1;


-- Gabungkan data transaksi dari user id 1 dan user id 2.
select * from transaction where user_id=1 UNION select * from transaction where user_id=2;

-- Tampilkan jumlah harga transaksi user id 1.
select sum(total) from transaction where user_id=1;

-- Tampilkan total transaksi dengan product type 2.
select count(id) from transaction_detail where product_id in (select id from product where product_type_id=2);

-- Tampilkan semua field table product dan field name table product type yang saling berhubungan.
select product.*,product_type.name as type_name from product inner join product_type on product.product_type_id = product_type.id;

-- Tampilkan semua field table transaction, field name table product dan field name table user.
SELECT transaction.*, product.name as product_name, user.nama as user_name FROM transaction INNER JOIN product ON transaction.id IN (
SELECT transaction_id from transaction_detail as td WHERE td.product_id = product.id)
INNER JOIN user ON transaction.user_id = user.id ORDER BY transaction.id;

-- Buat function setelah data transaksi dihapus maka transaction detail terhapus juga dengan transaction id yang dimaksud.
DELIMITER $$
CREATE trigger eraser1 after delete on transaction for each row
begin
declare v_transaction_id int;
set v_transaction_id = OLD.id;
delete from transaction_detail where transaction_id = v_transaction.id;
end$$
DELIMITER ;

-- Buat function setelah data transaksi detail dihapus maka data total_qty terupdate berdasarkan qty data transaction id yang dihapus.
DELIMITER $$
CREATE trigger total_updater AFTER DELETE ON transaction FOR EACH ROW
BEGIN
DECLARE v_total int;
SET v_total = OLD.id;
UPDATE transaction set total=(select sum(transaction_detail.qty) from transaction_detail where transaction.id = transaction_detail.transaction_id);
END $$
DELIMITER ;

-- Tampilkan data products yang tidak pernah ada di tabel transaction_details dengan sub-query.
select product.* from product where id NOT IN (select product_id from transaction_detail where transaction_detail.product_id = product.id );
