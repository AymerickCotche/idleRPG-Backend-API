const db = require('../database');

class charJob {

    constructor(obj={}) {
        for (const prop in obj) {
            this[prop] = obj[prop];
        }
    }

    async updateExp() {
        try {
            await db.query('UPDATE character_job SET exp = exp + $1 WHERE character_id = $2 AND job_id = $3', [this.plusExp, this.characterId, this.jobId]);
            return null;
        } catch (error) {
            console.log(error);
            if (error.detail) {
                throw new Error(error.detail)
            }
            throw error
        }
    }

    async getJobLevelCharacter() {
        try {
            const {rows} = await db.query('SELECT * FROM getJobLevelCharacter($1, $2)', [this.characterId, this.jobId]);
            console.log(rows[0]);
            return rows[0];
        } catch (error) {
            console.log(error);
            if (error.detail) {
                throw new Error(error.detail)
            }
            throw error
        }
    }

}

module.exports = charJob;