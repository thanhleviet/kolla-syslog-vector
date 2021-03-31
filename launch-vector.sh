#!/usr/bin/env bash
set -eo pipefail

# Debug
# docker stop qib-vector && docker rm qib-vector
# rm -f ~/kolla-logs/vector-*.log
# echo "Dropped!"

docker run -d --name qib-vector --restart unless-stopped \
--hostname=$(hostname) \
-v $(pwd)/vector-kolla.toml:/etc/vector/vector.toml:ro \
-v /var/log/kolla:/log/kolla \
-v /var/log:/var/log \
-p 8383:8686 \
timberio/vector:0.12.X-debian
