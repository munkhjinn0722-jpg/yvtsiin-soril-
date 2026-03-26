# yvtsiin-soril-
# 📘 Database Project – [Hotel Management System]

---

## 🧩 Системийн тайлбар
Энэхүү төсөл нь [Hotel Management System] системийн өгөгдлийн санг зохион байгуулсан болно.

Систем нь дараах үндсэн хүснэгтүүдээс бүрдэнэ:
* Table 1: **[guests]**
* Table 2: **[rooms]**
* Table 3: **[bookings]**
* Table 4: **[payments]**

Эдгээр хүснэгтүүд нь хоорондоо Foreign Key холбоотой бөгөөд бодит системийн өгөгдлийг хадгалах зориулалттай.

---

## ⚙️ Ашиглах заавар (Run Instructions)
Дараах дарааллаар ажиллуулна:

1. MySQL server ажиллаж байгаа эсэхийг шалгана.
2. mysqlScript.sql файлыг нээнэ.
3. Бүх кодыг нэг дор ажиллуулна.

👉 Үүний үр дүнд:

* Database үүснэ
* Хүснэгтүүд үүснэ
* Өгөгдөл орно
* Query-үүд ажиллана

---

## 🗂️ Файлын бүтэц
```text
/project
 ├── mysqlScript.sql
 └── README.md
SQL Script тайлбар 

```
--- 

mysqlScript.sql файл нь дараах хэсгүүдээс бүрдэнэ :

* Database үүсгэх
* Хүснэгтүүд (PK, FK)
* Sample data (INSERT)
* Query-үүд (JOIN, GROUP BY, HAVING )

Query бүр дээр тайлбар comment бичсэн.

---  

## 4-р хэсэг: Онол (Security)

1. NOT NULL болон UNIQUE constraint-ийн ялгаа

NOT NULL: Энэ нь тухайн баганыг хоосон орхиж болохгүй гэсэн шаардлага. Заавал ямар нэгэн утга оруулж байж бичлэг хадгалагдана. 
Хэрэглэгчийн нэр, нууц үг, эсвэл бүтээгдэхүүний үнэ гэх мэт заавал байх ёстой мэдээллүүд дээр ашиглана.

UNIQUE: Энэ нь тухайн баганад байгаа утгууд дахин давтагдах ёсгүй гэсэн шаардлага.
 И-мэйл хаяг, утасны дугаар, эсвэл иргэний бүртгэлийн дугаар гэх мэт системд цор ганц байх ёстой өгөгдлүүд дээр ашиглана.

Ялгаа: NOT NULL нь "хоосон байж болохгүй" гэж байгаа бол, UNIQUE нь "байж болно, гэхдээ байгаа бол өөр хаана ч давтагдахгүй байх ёстой" гэсэн үг. Сонирхолтой нь, нэг баганад энэ хоёрыг зэрэг ашиглаж бас болно (Жишээ нь: Хэрэглэгчийн нэр хоосон байж болохгүй бөгөөд давтагдах ёсгүй).

2. INNER JOIN ба LEFT JOIN-ийн ялгаа (Зочид буудлын жишээгээр)
Зочид буудлын системд хоёр хүснэгт байгаа. 101, 102, 103 тоот өрөөнүүд. 101 болон 102 тоотыг захиалсан мэдээлэл. (103 тоот захиалагдаагүй байгаа).

INNER JOIN 
Энэ нь хоёр хүснэгтэд хоёуланд нь байгаа өгөгдлийг л гаргаж ирнэ.
Үр дүн: Зөвхөн захиалгатай байгаа өрөөнүүдийн мэдээлэл гарч ирнэ.

 101, 102 тоот өрөөнүүд л жагсаалтад харагдана. 103 тоот захиалгагүй учраас харагдахгүй.

LEFT JOIN (Зүүн талын хүснэгт бүхэлдээ)
Энэ нь эхний (зүүн талын) хүснэгтийн бүх бичлэгийг аваад, хэрэв нөгөө хүснэгтэд харгалзах утга байвал түүнийг нь залгана. Байхгүй бол NULL гэж харуулна.
Үр дүн: Буудлын бүх өрөөнүүд жагсаалтаар гарч ирнэ.

101, 102 тоотууд захиалгын мэдээлэлтэйгээ гарна. Харин 103 тоот нь хажуудаа "Захиалаагүй" эсвэл NULL гэсэн утгатайгаар харагдана.

3. ALL PRIVILEGES эрх өгөх нь ямар эрсдэлтэй вэ?
Нэг хэрэглэгчид бүх эрхийг (ALL PRIVILEGES) өгөх нь байшингынхаа бүх өрөөний түлхүүрийг, сейфний нууц үгтэй нь хамт танихгүй хүнд өгч байгаатай л адил.
Хэрэв тухайн хэрэглэгчийн нэр, нууц үг хакердуулах эсвэл алдагдах юм бол хакер өгөгдлийн санг бүхэлд нь устгах , өөрчлөх эсвэл бүх нууц мэдээллийг хуулж авах боломжтой болно.
Туршлага багатай ажилтан бүх эрхтэй байхдаа ганцхан буруу комманд (Жишээ нь: DELETE FROM users гээд WHERE нөхцөл бичихээ мартах) өгөхөд л бүх өгөгдөл устах аюултай.
Хэн юу хийснийг хянахад хэцүү болно. Хүн бүр "Admin" эрхтэй байвал алдаа гаргасан эзнийг тогтоох боломжгүй.


---  

## 5-р хэсэг: Хэрэглэгч ба эрх (User & Privileges)
CREATE DATABASE hotel_db;
USE hotel_db;

CREATE TABLE guests (
    guest_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20)
);

CREATE TABLE rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) UNIQUE NOT NULL,
    room_type ENUM('Single', 'Double', 'Suite') NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL
);


CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);


INSERT INTO guests (first_name, last_name, email) VALUES 
('Bat', 'Bold', 'bat@example.com'),
('Saraa', 'Gua', 'saraa@example.com'),
('Tumur', 'Bagana', 'tumur@example.com');

INSERT INTO rooms (room_number, room_type, price_per_night) VALUES 
('101', 'Single', 50000),
('202', 'Double', 80000),
('303', 'Suite', 150000);

INSERT INTO bookings (guest_id, room_id, check_in_date, check_out_date) VALUES 
(1, 1, '2024-03-01', '2024-03-03'),
(2, 2, '2024-03-05', '2024-03-07'),
(1, 3, '2024-03-10', '2024-03-12');

INSERT INTO payments (booking_id, amount) VALUES (1, 100000), (2, 160000), (3, 300000);


SELECT g.first_name, g.last_name, r.room_number, b.check_in_date 
FROM bookings b
JOIN guests g ON b.guest_id = g.guest_id
JOIN rooms r ON b.room_id = r.room_id;


SELECT r.room_number, COUNT(b.booking_id) as booking_count
FROM rooms r
LEFT JOIN bookings b ON r.room_id = b.room_id
GROUP BY r.room_number;


SELECT room_id, COUNT(*) as count 
FROM bookings 
GROUP BY room_id 
ORDER BY count DESC 
LIMIT 1;

SELECT g.first_name, g.last_name, COUNT(b.booking_id) as total_bookings
FROM guests g
JOIN bookings b ON g.guest_id = b.guest_id
GROUP BY g.guest_id
HAVING total_bookings >= 2;

CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'AdminPassword123!';
GRANT ALL PRIVILEGES ON hotel_db.* TO 'admin_user'@'localhost';

CREATE USER 'report_user'@'localhost' IDENTIFIED BY 'ReportPassword123!';
GRANT SELECT ON hotel_db.* TO 'report_user'@'localhost';

SHOW GRANTS FOR 'admin_user'@'localhost';
SHOW GRANTS FOR 'report_user'@'localhost';

---  

## 6-р хэсэг: Backup & Restore 

MySQL Command Line screenshot 

📸 Ажилласан нотолгоо (MySQL CLI)

Доорх нь MySQL Command Line дээр ажиллуулсан үр дүн:
![alt text](image.png)

--- ![alt text](image-1.png)
![alt text](Pictures/my.png)
## Оюутны мэдээлэл 

* Нэр: Мөнхжин 
* Код: B210910171






