require 'timeout'

TIMEOUT_SECONDS = 2

Timeout::timeout(TIMEOUT_SECONDS) do
  sleep 3
end