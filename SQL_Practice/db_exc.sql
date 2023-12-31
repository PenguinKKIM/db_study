DROP TABLE tcons;
CREATE TABLE tcons (
	no INT,
	name VARCHAR (20),
	jumin VARCHAR (13) NOT NULL UNIQUE,
	area INT DEFAULT 1 CHECK (AREA <= 4) ,
	deptno VARCHAR (6)
);

ALTER TABLE tcons ADD CONSTRAINT tcons_no_PK PRIMARY KEY(NO);
ALTER TABLE tcons MODIFY COLUMN  NAME VARCHAR (20) NOT NULL;
ALTER TABLE tcons MODIFY COLUMN  jumin VARCHAR (20) NOT NULL;
ALTER TABLE tcons ADD CONSTRAINT tcons_jumin_uk UNIQUE(jumin);
ALTER TABLE tcons ADD CONSTRAINT tcons_area_ck AREA(); 
ALTER TABLE tcons ADD CONSTRAINT tcons_deptno_FK FOREIGN KEY(deptno) REFERENCES dept2(dcode);
