const Inventory = require('../models/inventory');
const jwt = require('../services/jwt');
const dbCache = require('../services/cache');

module.exports = {

    async addItem (request, response) {
        try {
            const inventory = await new Inventory(request.body).addItem();
            const token = jwt.makeToken(request.userId);
            response.setHeader('Authorization', jwt.makeToken(request.userId));
            await dbCache.set("user-0"+request.userId, token, {EX: 4*60*60, NX: false});
            response.status(201).json(inventory);
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message)
        }
    },

    async removeItem (request, response) {
        try {
            const instance = await new Inventory(request.body);
            console.log(request.body);
            const inventoryDeleted = instance.removeItem()
            const token = jwt.makeToken(request.userId);
            response.setHeader('Authorization', jwt.makeToken(request.userId));
            await dbCache.set("user-0"+request.userId, token, {EX: 4*60*60, NX: false});
            response.status(200).json(inventoryDeleted);
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message);
        }
    }
}