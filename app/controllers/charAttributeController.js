const CharAttribute = require('../models/charAttribute');
const jwt = require('../services/jwt');
const dbCache = require('../services/cache');

module.exports = {


    async updateIncrement (request, response, next) {
        try {
            response.locals.user = request.body.user;
            const charAttribute = await new CharAttribute(request.body).updateIncrement();
            const token = jwt.makeToken(request.userId);
            response.setHeader('Authorization', token);
            await dbCache.set("user-0"+request.userId, token, {EX: 4*60*60, NX: false});
            response.status(204).json('Enregistrement mis à jour');
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message)
        }
    },

    async updateHp (request, response, next) {
        try {
            if(request.body.hasWin === false) {
                const charAttribute = await new CharAttribute(request.body).updateHp();
                const token = jwt.makeToken(request.userId);
                response.setHeader('Authorization', token);
                await dbCache.set("user-0"+request.userId, token, {EX: 4*60*60, NX: false});
                return response.status(204).json('Enregistrement mis à jour');
            }
            const charAttribute = await new CharAttribute(request.body).updateHp();
            next();
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message)
        }
    },

    async augmentHp (request, response, next) {
        try {
            const charAttribute = await new CharAttribute(request.body).augmentHp();
            next();
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message)
        }
    },


}