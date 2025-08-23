-- --- Function                                      | Description                                                         |
-- | --------------------------------------------- | ------------------------------------------------------------------- |
-- | `NOW()`                                       | Returns current date and time (`YYYY-MM-DD HH:MM:SS`)               |
-- | `CURDATE()`                                   | Returns current date (`YYYY-MM-DD`)                                 |
-- | `CURTIME()`                                   | Returns current time (`HH:MM:SS`)                                   |
-- | `SYSDATE()`                                   | Like `NOW()` but evaluated at function call, not at statement start |
-- | `UTC_DATE()`, `UTC_TIME()`, `UTC_TIMESTAMP()` | Return current UTC date/time                                        |

-- | Function                         | Description                                |
-- | -------------------------------- | ------------------------------------------ |
-- | `DATE()`                         | Extracts date part from a datetime         |
-- | `TIME()`                         | Extracts time part from a datetime         |
-- | `YEAR()`, `MONTH()`, `DAY()`     | Get year, month, or day from a date        |
-- | `HOUR()`, `MINUTE()`, `SECOND()` | Get parts of time from a datetime          |
-- | `EXTRACT(part FROM date)`        | Extracts any part (e.g., `YEAR`, `MONTH`)  |
-- | `DATE_FORMAT(date, format)`      | Formats date into a string like `strftime` |
-- | `STR_TO_DATE(str, format)`       | Parses a string into a date                |

SELECT DATEDIFF('2025-09-01', '2025-08-23'); -- Returns 9
SELECT DATE_ADD(NOW(), INTERVAL 7 DAY); -- Adds 7 days to now
-- Get current timestamp
SELECT NOW();

-- Add 1 month to a date
SELECT DATE_ADD('2025-08-23', INTERVAL 1 MONTH);

-- Format date nicely
SELECT DATE_FORMAT(NOW(), '%W, %M %e, %Y');

-- Days between two dates
SELECT DATEDIFF('2025-12-31', '2025-08-23');
