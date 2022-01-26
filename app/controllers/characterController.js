const Character = require('../models/character');
const jwt = require('../services/jwt');
const dbCache = require('../services/cache');

module.exports = {

    async findOne (request, response) {
        try {
            const id = Number(request.params.id);
            const character = await Character.findOne(id);
            if (!character)
                return response.status(404).json(`No character found for the user with id ${id}`);
            const token = jwt.makeToken(request.userId);
            response.setHeader('Authorization', jwt.makeToken(request.userId));
            await dbCache.set("user-0"+request.userId, token, {EX: 4*60*60, NX: false});
            response.status(200).json(character);
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message)
        }
    },

    async create (request, response) {
        try {
            const character = await new Character(request.body).create();
            const token = jwt.makeToken(request.userId);
            response.setHeader('Authorization', jwt.makeToken(request.userId));
            await dbCache.set("user-0"+request.userId, token, {EX: 4*60*60, NX: false});
            response.status(201).json(character);
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message)
        }
    }
}