ALTER TABLE minions_info

ADD CONSTRAINT unique_containt 
UNIQUE (id, email),

ADD CONSTRAINT banana_check 
CHECK (banana > 0);


-- ALTER TABLE minions_info

-- ADD CONSTRAINT UQ_email_and_id 
-- UNIQUE (id, email)

-- ADD CONSTRAINT CK_banana_is_positive_number 
-- CHECK (banana >0);