
drop schema if exists hb_05_many_to_many;
create schema hb_05_many_to_many;

use hb_05_many_to_many;

set FOREIGN_KEY_CHECKS = 0;


DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `instructor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_unique` (`title`),
  KEY `FK_INSTRUCTOR_idx` (`instructor_id`),
  CONSTRAINT `FK_INSTRUCTOR` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `instructor`;

CREATE TABLE `instructor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `instructor_detail_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_DETAIL_idx` (`instructor_detail_id`),
  CONSTRAINT `FK_DETAIL` FOREIGN KEY (`instructor_detail_id`) REFERENCES `instructor_detail` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `instructor_detail`;

CREATE TABLE `instructor_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `youtube_channel` varchar(128) DEFAULT NULL,
  `hobby` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review`(
	id int(11) NOT NULL AUTO_INCREMENT,
    `comment` varchar(45) default null,
    course_id int(11) default null,
    primary key (id),
    key FK_COURSE_ID_idx (course_id),
    CONSTRAINT FK_COURSE FOREIGN KEY( course_id) REFERENCES course (id) ON DELETE NO ACTION ON UPDATE NO ACTION

) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS student;

create table student(
	id int(11) NOT NULL AUTO_INCREMENT,
    first_name varchar(45) default NULL,
    last_name varchar(45) default null,
    email varchar(45) default null,
    PRIMARY KEY (id)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS course_student;

CREATE TABLE course_student(
	course_id int(11) NOT NULL,
    student_id int(11) NOT NULL,
    
	PRIMARY KEY (course_id,student_id),
    
    KEY FK_STUDENT_idx (student_id),
    CONSTRAINT FK_COURSE_05 FOREIGN KEY (course_id) REFERENCES course (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT FK_STUDENT FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE NO ACTION ON UPDATE NO ACTION

)ENGINE=InnoDB DEFAULT CHARSET=latin1;

set FOREIGN_KEY_CHECKS = 1;