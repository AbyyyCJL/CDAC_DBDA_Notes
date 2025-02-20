create database Augst;
use Augst;

# String data type

create table char_eg(s_id int, s_name varchar(10));

desc char_eg; 

insert into char_eg values(1, "Abhay");
insert into char_eg values(2, "Anup");

select * from char_eg;

insert into char_eg values(1, 101);

select * from char_eg;

select char_length(s_name) as len_in_char, length(s_name) as no_of_bytes from char_eg;


################################################ BLOB ##################################################


create table blob_eg(img_name varchar(50), img_data blob);
insert into blob_eg values("A", load_file('C:\Users\Abhay\Pictures\Walpapers\1311287.jpeg'));	

select * from blob_eg;

###################################### TEXT ###############################################

create table text_eg(descrip text);
insert into text_eg values("I am abhay patil.");

select * from text_eg;

####################################### SET ##################################################3

create table set_eg(item_name varchar(10), item_option set('Spicy','Medium', 'Indian', 'no onion', 'no garlic'));

insert into set_eg(item_name,item_option) values("Samosa",'Medium,no garlic,no onion');

select * from set_eg;