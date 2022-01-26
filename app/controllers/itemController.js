const Item = require('../models/item');
const jwt = require('../services/jwt');
const dbCache = require('../services/cache');

module.exports = {

    async findAll(request, response) {
        try {
            const items = await Item.findAll();
            const token = jwt.makeToken(request.userId);
            response.setHeader('Authorization', jwt.makeToken(request.userId));
            await dbCache.set("user-0"+request.userId, token, {EX: 4*60*60, NX: false});
            response.json(items);
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message);
        }
    },

    async findAllCraftable(request, response) {
        try {
            const items = await Item.findAll();
            const token = jwt.makeToken(request.userId);
            response.setHeader('Authorization', jwt.makeToken(request.userId));
            await dbCache.set("user-0"+request.userId, token, {EX: 4*60*60, NX: false});
            response.json(items);
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message);
        }
    }

}