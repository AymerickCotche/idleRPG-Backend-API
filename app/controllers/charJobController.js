const CharJob = require('../models/charJob');
const jwt = require('../services/jwt');
const dbCache = require('../services/cache');

module.exports = {


    async updateExp (request, response, next) {
        try {
            await new CharJob(request.body).updateExp();
            next();
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message)
        }
    },

    async getJobLevelCharacter (request, response) {
        try {
            const level = await new CharJob(request.body).getJobLevelCharacter();
            const token = jwt.makeToken(request.userId);
            response.setHeader('Authorization', token);
            await dbCache.set("user-0"+request.userId, token, {EX: 4*60*60, NX: false});
            response.status(200).json({'level': level});
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message)
        }
    }

}