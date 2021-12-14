const prisma = require("../../utils/database");

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

module.exports = { createArtist };
