const express = require("express");
const router = express.Router();
const { getServers, addServer, updateServer, deleteServer } = require("../controllers/serverController");
const { protect } = require("../middleware/authMiddleware");

router.route("/").get(protect, getServers).post(protect, addServer);
router.route("/:id").put(protect, updateServer).delete(protect, deleteServer);

module.exports = router;
