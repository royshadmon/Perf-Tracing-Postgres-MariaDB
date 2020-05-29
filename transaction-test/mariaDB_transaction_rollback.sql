START TRANSACTION;

UPDATE students set dept_no=3 where student_id=1;

ROLLBACK;