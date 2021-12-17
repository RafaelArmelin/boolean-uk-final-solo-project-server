const prisma = require("../../utils/database");

const getAllArtists = async (req, res) => {
  try {
    const result = await prisma.user.findMany({
      where: { role: "ARTIST" },
      include: {
        artistProfile: true,
      },
    });
    res.json(result);
  } catch (error) {
    console.error({ error: error.message });
    res.status(500).json({ error: error.message });
  }
};

const getArtistById = async (req, res) => {
  try {
    const id = req.params.id;

    const result = await prisma.user.findUnique({
      where: {
        id: parseInt(id),
      },
      include: {
        artistProfile: true,
        bookings: true,
      },
    });
    res.json(result);
  } catch (error) {
    console.error({ error: error.message });
    res.status(500).json({ error: error.message });
  }
};

const createArtist = async (req, res) => {
  const data = req.body;
  const { name, location, imageUrl } = data;

  try {
    const result = await prisma.artist.create({
      data: {
        name,
        location,
        imageUrl,
      },
    });
    res.json(result);
  } catch (error) {
    console.error({ error: error.message });
    res.status(500).json({ error: error.message });
  }
};

module.exports = { createArtist, getAllArtists, getArtistById };
