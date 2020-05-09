use traineemanager;

CREATE TABLE role(
id int NOT NULL PRIMARY KEY auto_increment,
name VARCHAR(255) NOT NULL,
code VARCHAR(255) NOT NULL,
status int,	
created_date TIMESTAMP,
modified_date TIMESTAMP,
created_by int,
modified_by int
);

create table users( -- dùng lưu thông thin user
id int primary key auto_increment,
email varchar(100) not null unique,
username nvarchar(100),
password varchar(100) not null,
phone_number varchar(100),
address text,
dob TIMESTAMP,
university text,
role_id int, 
status int,		-- =1 đang hoạt động, -1 đã xóa , chờ duyệt 0
created_date TIMESTAMP,
modified_date TIMESTAMP,
created_by int,
modified_by int,
deactived_at TIMESTAMP -- ngày bị xóa
);

ALTER TABLE users ADD CONSTRAINT fk_user_role FOREIGN KEY (role_id) REFERENCES role(id);

INSERT INTO `traineemanager`.`role` (`name`, `code`) VALUES ('quan-tri', 'admin');
INSERT INTO `traineemanager`.`role` (`name`, `code`) VALUES ('user', 'user');

INSERT INTO `traineemanager`.`users` (`email`, `username`, `password`, `phone_number`, `address`, `dob`, `university`, `role_id`, `status`) VALUES ('vuthanh3298@gmail.com', 'vuthanh', '123', '0777933595', '40b', '1998-02-03 00:00:00', 'uit', '1', '1');
INSERT INTO `traineemanager`.`users` (`email`, `username`, `password`, `phone_number`, `address`, `dob`, `university`, `role_id`, `status`) VALUES ('tranght636@gmail.com', 'thuytrang', '123', '0352902224', 'daknong', '1996-02-16 00:00:00', 'uit', '2', '1');

-- ----------------------------

create table courses(-- lưu khóa học jwat2019
id int primary key auto_increment,
name text,-- tên khóa học
start_time TIMESTAMP, -- thời gian bắt đầu
end_time TIMESTAMP , -- thời gian kết thúc
description text, -- mô tả lưu có giai đoạn nào: Sql, java, git
note text,
status int,-- dùng để lưu trạng thái đã xóa (false)
created_date TIMESTAMP,
modified_date TIMESTAMP,
created_by int,
modified_by int
);

create table stage( -- lưu giai đoạn sql, java, spring
id int primary key auto_increment,
courses_id int,
constraint fk_stage_courses foreign key (courses_id ) references courses(id),
name nvarchar(100),
description text,
note text,
_index int,
num_of_lesson int,
status int,-- dùng để lưu trạng thái đã xóa (false)
created_date TIMESTAMP,
modified_date TIMESTAMP,
created_by int,
modified_by int
);

create table chapter ( -- (Bài học, chương. Bài 1 2 3 trong class SQL)"
id int primary key auto_increment,
stage_id int,
constraint fk_chapter_classes foreign key (stage_id ) references stage(id),
name nvarchar(255),
_index int,
status int,
created_date TIMESTAMP,
modified_date TIMESTAMP,
created_by int,
modified_by int
);

create table rooms(-- lưu phòng học
id int primary key auto_increment,
name text,
maximum_seat int,
description text,
note text,
status int,
created_date TIMESTAMP,
modified_date TIMESTAMP,
created_by int,
modified_by int
);


create table lesson( -- Buổi bọc
	id int primary key auto_increment,
    name nvarchar(255), -- chapter2(4,5) + chapter3(1,2,3)
    stage_id int,
    constraint fk_lesson_stage foreign key (stage_id ) references stage(id),
    num_of_student int,
    room_id int,
    constraint fk_lesson_room foreign key (room_id ) references rooms(id),
    status int,
    created_date TIMESTAMP,
	modified_date TIMESTAMP,
	created_by int,
	modified_by int
);



create table classes ( -- jwat02, jwat03
	id int primary key auto_increment,
    name nvarchar(255),
    course_id int,
    constraint fk_classes_courses foreign key (course_id ) references courses(id),
    is_done bit,
    status int,
	created_date TIMESTAMP,
	modified_date TIMESTAMP,
	created_by int,
	modified_by int
);

create table user_in_class( -- lưu thông tin user thuộc lớp nào
class_id int,
constraint fk_user_in_class_classes foreign key (class_id ) references classes(id),
user_id int,
constraint fk_user_in_class_users foreign key (user_id ) references users(id),
primary key (class_id, user_id),
status int,
created_date TIMESTAMP,
modified_date TIMESTAMP,
created_by int,
modified_by int
);

create table notifications( -- dùng lưu thông báo
id int primary key auto_increment,
title text,
content text,
to_classes varchar(255),-- id lớp nhận thông báo, nối chuỗi cách nhau bởi _
status int,
created_date TIMESTAMP,
modified_date TIMESTAMP,
created_by int,
modified_by int
);

create table comments(
	id int primary key auto_increment,
    content text,
    reply_to int,
    constraint fk_comments_notifications foreign key (reply_to) references notifications(id),
    status int,
	created_date TIMESTAMP,
	modified_date TIMESTAMP,
	created_by int,
	modified_by int
);

create table deadline(
	id int primary key auto_increment,
    title varchar(255),
    content text,
    to_classes varchar(255), -- id lớp nhận thông báo, nối chuỗi cách nhau bởi _ , có thể có deadline cho tất cả
    due_date TIMESTAMP,-- ngày hết hạn thông báo, k có hạn thì null
	is_register bit, -- deadline có 2 loại là đăng kí lịch và khác
    year int,-- lưu năm 
	week int, -- lưu tuần
    status int,
	created_date TIMESTAMP,
	modified_date TIMESTAMP,
	created_by int,
	modified_by int
);

-- để biết user có đăng kí lịch hay chưa
-- đầu tiên lấy all thông báo có due_date > ngày hiện tại và is_regis = true
-- lấy ra các tuần còn hiệu lực
-- check exist tuần trong bản student_register_schedual

create table user_register_schedule(-- lưu đăng ký lịch học
id int primary key auto_increment,
user_id int,
constraint fk_user_register_schedule_users foreign key (user_id) references users(id),
deadline_id int,
constraint fk_user_register_schedule_deadline foreign key (deadline_id) references deadline(id),
is_register bit,
year int,-- lưu năm 
week int, -- lưu tuần
schedule varchar(255), -- C2-S2-C3-S3
url_homework varchar(255), -- dùng để lưu url chứa code bài tập deadline, loại khác
status int,
created_date TIMESTAMP,
modified_date TIMESTAMP,
created_by int,
modified_by int
);

-- lịch admin soạn: (mã lớp, mã phòng, tên trainer, buổi, ngày, tên bài học, số lượng tham gia, )
create table main_schedules(
id int primary key auto_increment,
room_id int,
constraint fk_main_schedules_rooms foreign key (room_id ) references rooms(id),
lesson_id int,
constraint fk_main_schedules_lesson foreign key (lesson_id ) references lesson(id),
trainer_name nvarchar(100), -- tên người trainer
year int,-- năm 
week int,-- tuần
weekday int, 
period bit, -- true sáng, false chiều
start_time TIMESTAMP, -- thời gian bắt đầu
end_time TIMESTAMP,  -- thời gian kết thúc
note text,
status int,
created_date TIMESTAMP,
modified_date TIMESTAMP,
created_by int,
modified_by int
);

create table user_off(
	main_schedual_id int,
    constraint fk_user_of_user_register_schedule foreign key (main_schedual_id) references main_schedules(id),
    user_id int,
    constraint fk_user_of_users foreign key (user_id) references users(id),
    reason text,
    note_from_admin text,
    is_approved int, -- -1 không duyệt, 0 đang chờ, 1 đã duyệt
    status int,
	created_date TIMESTAMP,
	modified_date TIMESTAMP,
	created_by int,
	modified_by int
);

create table user_seen_notification (-- lưu người xem
notification_id int,
constraint fk_user_seen_notification_notifications foreign key (notification_id ) references notifications(id),
user_id int,
constraint fk_user_seen_notification_users foreign key (user_id ) references users(id),
seen_status bit, -- lưu người đó đã xem thông báo hay chưa
seen_at TIMESTAMP,-- thời gian xem thông báo
primary key (notification_id, user_id)
);

create table process(-- lưu tiến độ học , lưu theo bài
user_id int,
lesson_id int,
constraint fk_process_users foreign key (user_id ) references users(id),
constraint fk_process_lesson foreign key (lesson_id ) references lesson(id),
primary key (user_id, lesson_id)
);

create table roll_calls(-- bảng điểm danh
main_schedule_id int,
constraint fk_roll_calls_main_schedules foreign key (main_schedule_id ) references main_schedules(id),
user_id int,
constraint fk_roll_calls_users foreign key (user_id ) references users(id),
roll_call_at date,
primary key (main_schedule_id, user_id),
status int,
note text,
created_date TIMESTAMP,
modified_date TIMESTAMP,
created_by int,
modified_by int
);

create table reset_password(
id int primary key auto_increment,
email varchar(100) unique,
token text,
status int,
created_date TIMESTAMP,
modified_date TIMESTAMP,
created_by int,
modified_by int
);