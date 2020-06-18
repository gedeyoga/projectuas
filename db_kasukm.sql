CREATE DATABASE db_kasukm;
USE db_kasukm;


/* TABLE ROLE USER */
CREATE TABLE roleUser(
	idRole INT NOT NULL AUTO_INCREMENT,
	namaRole VARCHAR(15) NOT NULL,
	
	CONSTRAINT pk_roleuser PRIMARY KEY (idRole)
);
INSERT INTO roleUser VALUES
(NULL , 'Admin'),
(NULL , 'Member');
/* TABLE ROLE USER */

/* TABLE JABATAN */
CREATE TABLE jabatan(
	idJbtn INT NOT NULL AUTO_INCREMENT,
	namaJbtn VARCHAR(15) NOT NULL,
	
	CONSTRAINT pk_jabatan PRIMARY KEY (idJbtn)
);
ALTER TABLE jabatan CHANGE COLUMN namaJbtn
namaJbtn VARCHAR(25) NOT NULL;

INSERT INTO jabatan VALUES
(NULL , 'Ketua'),
(NULL , 'Wakil Ketua'),
(NULL , 'Sekretaris 1'),
(NULL , 'Sekeretaris 2'),
(NULL , 'Bendahara 1'),
(NULL , 'Bendahara 2'),
(NULL , 'Anggota');
/* TABLE JABATAN */

/* TABLE JURUSAN */
CREATE TABLE jurusan(
	idJrs INT NOT NULL AUTO_INCREMENT,
	namaJrs VARCHAR(50) NOT NULL,
	
	CONSTRAINT pk_jurusan PRIMARY KEY (idJrs)
);
INSERT INTO jurusan VALUES 
(NULL , 'TI - Manajemen Teknik Informatika'),
(NULL , 'TI - Komputer Akuntansi & Bisnis');
/* TABLE JURUSAN */

/* TABLE MAHASISWA */
CREATE TABLE mahasiswa(
	nimMhs INT NOT NULL,
	namaMhs VARCHAR(50) NOT NULL,
	tglLahirMhs DATE NOT NULL,
	jkMhs INT NOT NULL,
	telpMhs VARCHAR(20) NOT NULL,
	emailMhs VARCHAR(50) NOT NULL,
	idJbtn INT NOT NULL,
	idJrs INT NOT NULL,
	
	CONSTRAINT pk_mahasiswa PRIMARY KEY (nimMhs)
);
ALTER TABLE mahasiswa 
ADD CONSTRAINT fk_jabatan FOREIGN KEY (idJbtn) REFERENCES jabatan(idJbtn) ON DELETE RESTRICT,
ADD CONSTRAINT fk_jurusan FOREIGN KEY (idJrs) REFERENCES jurusan(idJrs) ON DELETE RESTRICT;

ALTER TABLE mahasiswa CHANGE COLUMN telpMhs
telpMhs VARCHAR(20) NOT NULL;
INSERT INTO mahasiswa VALUES
('10101010' , 'Admin' , '2020-12-12' , '1','081234567890' , 'admin@admin.com' , '1' , '1');
/* TABLE MAHASISWA */

/* TABLE USERS */
CREATE TABLE users(
	idUsers INT NOT NULL AUTO_INCREMENT,
	nimMhs INT NOT NULL,
	passUsers VARCHAR(250) NOT NULL,
	idRole INT NOT NULL,
	
	CONSTRAINT pk_users PRIMARY KEY (idUsers)
);
ALTER TABLE users 
ADD CONSTRAINT fk_roleuser FOREIGN KEY (idRole) REFERENCES roleUser(idRole) ON DELETE RESTRICT;
ALTER TABLE users 
ADD CONSTRAINT fk_mahasiswa FOREIGN KEY (nimMhs) REFERENCES mahasiswa(nimMhs) ON DELETE CASCADE;
INSERT INTO users VALUES
(NULL , '10101010' , '123456' , '1');
ALTER TABLE users
ADD imgUsers VARCHAR(50) NULL;
UPDATE users SET imgUsers = 'default.png' WHERE idUsers = 1;
/* TABLE USERS */

