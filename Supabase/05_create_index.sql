CREATE INDEX concurrently IF NOT EXISTS 
  idx_sessions_session_date
ON 
  sessions(session_date)