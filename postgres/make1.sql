------------------------------------------
-- Adds timestamp for creation and update for each table
------------------------------------------
ALTER TABLE users ADD COLUMN date_added timestamp default current_timestamp;
ALTER TABLE users ADD COLUMN date_updated timestamp default null;

ALTER TABLE class ADD COLUMN date_added timestamp default current_timestamp;
ALTER TABLE class ADD COLUMN date_updated timestamp default null;

ALTER TABLE student_record ADD COLUMN date_added timestamp default current_timestamp;
ALTER TABLE student_record ADD COLUMN date_updated timestamp default null;

ALTER TABLE problem ADD COLUMN date_added timestamp default current_timestamp;
ALTER TABLE problem ADD COLUMN date_updated timestamp default null;

ALTER TABLE submission ADD COLUMN date_added timestamp default current_timestamp;
ALTER TABLE submission ADD COLUMN date_updated timestamp default null;

ALTER TABLE assignment ADD COLUMN date_added timestamp default current_timestamp;
ALTER TABLE assignment ADD COLUMN date_updated timestamp default null;

------------------------------------------
-- Create function and triggers for updating the timestamp
------------------------------------------

CREATE FUNCTION update_timestamp() RETURNS trigger
AS
$BODY$
BEGIN
NEW.date_updated = now();
RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER users_update_trigger BEFORE UPDATE ON users 
FOR EACH ROW EXECUTE PROCEDURE update_timestamp();
CREATE TRIGGER class_update_trigger BEFORE UPDATE ON class 
FOR EACH ROW EXECUTE PROCEDURE update_timestamp();
CREATE TRIGGER student_record_update_trigger BEFORE UPDATE ON student_record 
FOR EACH ROW EXECUTE PROCEDURE update_timestamp();
CREATE TRIGGER problem_update_trigger BEFORE UPDATE ON problem 
FOR EACH ROW EXECUTE PROCEDURE update_timestamp();
CREATE TRIGGER submission_update_trigger BEFORE UPDATE ON submission 
FOR EACH ROW EXECUTE PROCEDURE update_timestamp();
CREATE TRIGGER assignment_update_trigger BEFORE UPDATE ON assignment 
FOR EACH ROW EXECUTE PROCEDURE update_timestamp();