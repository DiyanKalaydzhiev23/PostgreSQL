ALTER TABLE minions_info

ADD CONSTRAINT banana_check
CHECK (banana > 0),

ADD CONSTRAINT unique_containt
UNIQUE (id, email);
