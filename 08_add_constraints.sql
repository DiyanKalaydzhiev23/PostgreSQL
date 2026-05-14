ALTER TABLE minions_info

ADD CONSTRAINT unique_containt
UNIQUE (id, email),

ADD CONSTRAINT banana_check
CHECK (banana > 0);