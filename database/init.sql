CREATE TABLE IF NOT EXISTS logs (
  method VARCHAR(10) NOT NULL,
  route VARCHAR(2048) NOT NULL,
  total_results INT NOT NULL,
  client_ip VARCHAR(45) NOT NULL,
  created_at DATETIME NOT NULL
);
