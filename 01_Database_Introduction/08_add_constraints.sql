ALTER TABLE minions_info

ADD CONSTRAINT unique_containt  -- uq_minions_info_id_email
UNIQUE (id, email),

ADD CONSTRAINT banana_check  -- chk_minions_info_banana_greater_than_zero
CHECK (banana > 0);