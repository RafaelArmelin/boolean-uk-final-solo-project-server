const express = require("express");

const { createArtist, getAllArtists, getArtistById } = require("./controller");

const router = express.Router();

router.get("/", getAllArtists);

router.get("/:id", getArtistById);

router.post("/", createArtist);

module.exports = router;
