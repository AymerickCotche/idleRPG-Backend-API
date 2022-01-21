const {createClient} = require('redis');
const config = {}
if (process.env.NODE_ENV === 'production') {
    config.url = REDIS_TLS_URL
}
const db = createClient(config);
db.connect();

module.exports = db;