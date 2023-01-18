#!/bin/bash

echo "Starting Invidious..."

#!/bin/bash
set -eou pipefail
su - postgres -c "pg_ctl -D /var/lib/postgresql/data start"
#RUN find /invidious/config/sql -name '*.sql' -exec psql -U postgres -d invidious -f {} \;


psql --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < config/sql/channels.sql
psql --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < config/sql/videos.sql
psql --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < config/sql/channel_videos.sql
psql --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < config/sql/users.sql
psql --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < config/sql/session_ids.sql
psql --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < config/sql/nonces.sql
psql --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < config/sql/annotations.sql
psql --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < config/sql/playlists.sql
psql --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < config/sql/playlist_videos.sql

exec tini /invidious/invidious

