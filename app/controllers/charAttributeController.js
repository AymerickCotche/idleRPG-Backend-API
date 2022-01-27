const CharAttribute = require('../models/charAttribute');
const jwt = require('../services/jwt');
const dbCache = require('../services/cache');

module.exports = {


    async updateIncrement (request, response) {
        try {
            const charAttribute = new CharAttribute(request.body).updateIncrement();
            const token = jwt.makeToken(request.userId);
            response.setHeader('Authorization', jwt.makeToken(request.userId));
            await dbCache.set("user-0"+request.userId, token, {EX: 4*60*60, NX: false});
            response.status(204).json("Caractéristique augmentée");
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message)
        }
    }

}